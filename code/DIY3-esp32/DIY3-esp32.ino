
#include <driver/adc.h>
#include <esp_wifi.h>
#include <esp_bt.h>
#include <esp32/ulp.h>

// Additional includes for peripheral devices
#include <FS.h>
#include <SD.h>
#include <SPI.h>
#include "RTClib.h"
#include "MS5803_05.h"

#include "hulp.h"

#define ECHO_TO_SERIAL 1

#define SD_CS_PIN D9
#define RTC_POWER_PIN D3

RTC_DS3231 rtc;
DateTime now;

RTC_DATA_ATTR MS_5803 sensor(4096); // MAYBE CAN LOWER OVERSAMPLING

uint8_t oldDay = 0;

RTC_DATA_ATTR ulp_var_t ulpNum;
RTC_DATA_ATTR ulp_var_t ulpR0;

/*
void printResetReason(esp_reset_reason_t reason) {
    switch (reason) {
        case ESP_RST_UNKNOWN: Serial.println("unknown"); break;
        case ESP_RST_POWERON: Serial.println("poweron"); break;
        case ESP_RST_EXT: Serial.println("ext"); break;
        case ESP_RST_SW: Serial.println("sw"); break;
        case ESP_RST_PANIC: Serial.println("panic"); break;
        case ESP_RST_INT_WDT: Serial.println("int_wdt"); break;
        case ESP_RST_TASK_WDT: Serial.println("task wdt"); break;
        case ESP_RST_WDT: Serial.println("wdt"); break;
        case ESP_RST_DEEPSLEEP: Serial.println("deepsleep"); break; 
        case ESP_RST_BROWNOUT: Serial.println("brownout"); break;
        case ESP_RST_SDIO: Serial.println("sdio"); break;
    }
}
*/


void setup() {

    const ulp_insn_t program[] = {
        I_MOVI(R2, 0),
        I_GET(R1, R2, ulpNum),
        I_ADDI(R1, R1, 10),
        I_PUT(R1, R2, ulpNum),

        
        I_MOVI(R0, 2),
        I_GPIO_SET_RD(GPIO_NUM_26),
        I_PUT(R0, R2, ulpR0),           // STORE R0 in memory
        M_BGE(22, 1),                   // JUMP IF R0 >= 1
        I_GPIO_SET(GPIO_NUM_26, 1),     // ELSE SET GPIO ON
        M_BX(11),                       // JUMP OUT OF IF
        M_LABEL(22),                   
        I_GPIO_SET(GPIO_NUM_26, 0),     // SET GPIO OFF
        M_LABEL(11),
      
    };

    #if ECHO_TO_SERIAL
        Serial.begin(115200);
        delay(1000);
        Serial.printf("VAL: %d\n", ulpNum.val);
        Serial.printf("R0: %d\n", ulpR0.val);
        Serial.flush();
    #else
        // ADC, WiFi, BlueTooth are disabled by default.        
        // Default CPU frequency is 240MHz, but we don't need high speed.
        setCpuFrequencyMhz(10);     
    #endif

    pinMode(SD_CS_PIN, OUTPUT);
    pinMode(RTC_POWER_PIN, OUTPUT);

    switch (esp_reset_reason()) {    
        case ESP_RST_POWERON: {
            // Initialize the connection with the RTC:
            // Power to the RTC is provided by a GPIO pin. We need to wait a short 
            // duration (10ms seems to work) before connecting to the RTC or it fails.
            // This might be because it has to switch from battery power to VCC power.
            digitalWrite(RTC_POWER_PIN, HIGH);
            // According to the datasheet, the oscillator takes <1 sec to begin (on 
            // first time startup), so we wait 1 second in case this is the first time
            // startup. This accounts for the 10ms delay mentioned above, too.
            delay(1000); 
            if (!rtc.begin()) {
                #if ECHO_TO_SERIAL
                    Serial.println(F("RTC setup error"));
                    Serial.flush();
                #endif
            }

            now = rtc.now();
            Serial.print(now.year());
            Serial.print(F("-"));
            Serial.print(now.month());
            Serial.print(F("-"));
            Serial.print(now.day());
            Serial.print(F(" @ "));
            Serial.print(now.hour());
            Serial.print(F(":"));
            Serial.print(now.minute());
            Serial.print(F(":"));
            Serial.println(now.second());

            // Initialize the connection with the SD card.
            if (!SD.begin(SD_CS_PIN)) {
                #if ECHO_TO_SERIAL
                    Serial.println(F("SD setup error"));
                    Serial.flush();
                #endif
            }

            // Initialize the connection with the MS5803-05 pressure sensor.
            if (!sensor.initializeMS_5803(true)) {
                #if ECHO_TO_SERIAL
                    Serial.println(F("MS5803-05 sensor setup error"));
                    Serial.flush();
                #endif
            }
            sensor.readSensor();
            Serial.println(sensor.pressure());

            digitalWrite(RTC_POWER_PIN, LOW);
            //Wire.~TwoWire(); // essentially Wire.end(); MIGHT BE UNNECESSARY

            ulpNum.val = 0;
            hulp_peripherals_on();
            hulp_configure_pin(GPIO_NUM_26, RTC_GPIO_MODE_OUTPUT_ONLY, GPIO_FLOATING, 0);
            ESP_ERROR_CHECK(hulp_ulp_load(program, sizeof(program), 2 * 1000000, 0));
            ESP_ERROR_CHECK(hulp_ulp_run(0));
            
            esp_deep_sleep(8 * 1000000);

            break; // switch
        }

        case ESP_RST_DEEPSLEEP: {
            Serial.println("IM AWAAAAKE");
            Serial.flush();

            /*
            
            // The I2C pull-up resistors are on the DS3231 board which is pin
            // powered, so that pin must be powered for I2C to work with the 
            // MS5803.
            digitalWrite(RTC_POWER_PIN, HIGH);
            delay(50);

            // I2C communication needs to be reinitialized after a deep sleep
            // reset. The sensor.initializeMS_5803() method could be used here
            // instead but it would add unecessary initialization steps.
            Wire.begin();
            sensor.resetSensor();      
                  
            sensor.readSensor();
            Serial.print("Pressure: ");
            Serial.println(sensor.pressure());
            Serial.flush();
            digitalWrite(RTC_POWER_PIN, LOW);
            */

            hulp_peripherals_on();
            hulp_configure_pin(GPIO_NUM_26, RTC_GPIO_MODE_OUTPUT_ONLY, GPIO_FLOATING, 0);
            ESP_ERROR_CHECK(hulp_ulp_load(program, sizeof(program), 2 * 1000000, 0));
            ESP_ERROR_CHECK(hulp_ulp_run(0));

            esp_deep_sleep(8 * 1000000);

            break; // switch
        }

        default: 
            #if ECHO_TO_SERIAL
                Serial.println("RESET REASON CASE NOT HANDLED");
                Serial.flush();
            #endif
    }
}

void loop() {}