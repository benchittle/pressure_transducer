EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Pressure Transducer DIY"
Date ""
Rev "1.0"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L MCU_Microchip_ATmega:ATmega328P-PU U1
U 1 1 60A4646F
P 2000 2400
F 0 "U1" H 1450 2450 50  0000 R CNN
F 1 "ATmega328P-PU" H 1450 2350 50  0000 R CNN
F 2 "Package_DIP:DIP-28_W7.62mm_Socket" H 2000 2400 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/ATmega328_P%20AVR%20MCU%20with%20picoPower%20Technology%20Data%20Sheet%2040001984A.pdf" H 2000 2400 50  0001 C CNN
	1    2000 2400
	1    0    0    -1  
$EndComp
$Comp
L Breakouts:DS3231_breakout A2
U 1 1 60A4A9F0
P 4800 2300
F 0 "A2" H 4472 2259 50  0000 R CNN
F 1 "DS3231_breakout" H 4472 2350 50  0000 R CNN
F 2 "Breakouts:DS3231_RTC_breakout" H 4950 2300 50  0001 C CNN
F 3 "" H 4950 2300 50  0001 C CNN
	1    4800 2300
	-1   0    0    1   
$EndComp
$Comp
L Breakouts:SD_reader_breakout A1
U 1 1 60A4BD05
P 4800 1300
F 0 "A1" H 4472 1259 50  0000 R CNN
F 1 "SD_reader_breakout" H 4472 1350 50  0000 R CNN
F 2 "Breakouts:SD_reader_breakout" H 4800 1350 50  0001 C CNN
F 3 "" H 4800 1350 50  0001 C CNN
	1    4800 1300
	-1   0    0    1   
$EndComp
Wire Wire Line
	2000 900  2000 850 
Wire Wire Line
	2000 850  2050 850 
Wire Wire Line
	2100 850  2100 900 
$Comp
L power:VCC #PWR02
U 1 1 60A55020
P 2050 850
F 0 "#PWR02" H 2050 700 50  0001 C CNN
F 1 "VCC" H 2065 1023 50  0000 C CNN
F 2 "" H 2050 850 50  0001 C CNN
F 3 "" H 2050 850 50  0001 C CNN
	1    2050 850 
	1    0    0    -1  
$EndComp
Connection ~ 2050 850 
Wire Wire Line
	2050 850  2100 850 
$Comp
L power:GND #PWR01
U 1 1 60A5AE12
P 2000 3900
F 0 "#PWR01" H 2000 3650 50  0001 C CNN
F 1 "GND" H 2005 3727 50  0000 C CNN
F 2 "" H 2000 3900 50  0001 C CNN
F 3 "" H 2000 3900 50  0001 C CNN
	1    2000 3900
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR03
U 1 1 60A5B7BD
P 2950 2400
F 0 "#PWR03" H 2950 2250 50  0001 C CNN
F 1 "VCC" V 2965 2528 50  0000 L CNN
F 2 "" H 2950 2400 50  0001 C CNN
F 3 "" H 2950 2400 50  0001 C CNN
	1    2950 2400
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 60A5CBAB
P 2950 2550
F 0 "R2" V 3050 2550 50  0000 C CNN
F 1 "10K" V 2950 2550 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P15.24mm_Horizontal" V 2880 2550 50  0001 C CNN
F 3 "~" H 2950 2550 50  0001 C CNN
	1    2950 2550
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR08
U 1 1 60A5E4E8
P 4400 1150
F 0 "#PWR08" H 4400 1000 50  0001 C CNN
F 1 "VCC" V 4415 1277 50  0000 L CNN
F 2 "" H 4400 1150 50  0001 C CNN
F 3 "" H 4400 1150 50  0001 C CNN
	1    4400 1150
	0    -1   -1   0   
$EndComp
$Comp
L power:VCC #PWR09
U 1 1 60A5FCEB
P 4400 2450
F 0 "#PWR09" H 4400 2300 50  0001 C CNN
F 1 "VCC" V 4415 2577 50  0000 L CNN
F 2 "" H 4400 2450 50  0001 C CNN
F 3 "" H 4400 2450 50  0001 C CNN
	1    4400 2450
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR010
U 1 1 60A61B66
P 4400 2550
F 0 "#PWR010" H 4400 2300 50  0001 C CNN
F 1 "GND" V 4405 2422 50  0000 R CNN
F 2 "" H 4400 2550 50  0001 C CNN
F 3 "" H 4400 2550 50  0001 C CNN
	1    4400 2550
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR07
U 1 1 60A62A6C
P 4400 1050
F 0 "#PWR07" H 4400 800 50  0001 C CNN
F 1 "GND" V 4405 922 50  0000 R CNN
F 2 "" H 4400 1050 50  0001 C CNN
F 3 "" H 4400 1050 50  0001 C CNN
	1    4400 1050
	0    1    1    0   
$EndComp
Text GLabel 2600 1200 2    50   Input ~ 0
CS
Text GLabel 4400 1550 0    50   Input ~ 0
CS
Text GLabel 2600 1500 2    50   Input ~ 0
MOSI
Text GLabel 4400 1350 0    50   Input ~ 0
MOSI
Text GLabel 2600 1600 2    50   Input ~ 0
MISO
Text GLabel 2600 1700 2    50   Input ~ 0
SCK
Text GLabel 4400 1250 0    50   Input ~ 0
MISO
Text GLabel 4400 1450 0    50   Input ~ 0
SCK
Text GLabel 2600 1800 2    50   Input ~ 0
32K
Text GLabel 4400 2050 0    50   Input ~ 0
32K
Text GLabel 4400 2150 0    50   Input ~ 0
Alarm1
Text GLabel 2600 3100 2    50   Input ~ 0
Alarm1
Text GLabel 4400 2250 0    50   Input ~ 0
SCL
Text GLabel 4400 2350 0    50   Input ~ 0
SDA
Text GLabel 2600 2600 2    50   Input ~ 0
SCL
Text GLabel 2600 2500 2    50   Input ~ 0
SDA
$Comp
L Device:LED D1
U 1 1 60A679ED
P 2750 3300
F 0 "D1" H 2650 3350 50  0000 C CNN
F 1 "ERR_LED_RED" H 2600 3450 50  0000 C CNN
F 2 "LED_THT:LED_D3.0mm" H 2750 3300 50  0001 C CNN
F 3 "~" H 2750 3300 50  0001 C CNN
	1    2750 3300
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR04
U 1 1 60A685DC
P 3200 3300
F 0 "#PWR04" H 3200 3050 50  0001 C CNN
F 1 "GND" V 3205 3172 50  0000 R CNN
F 2 "" H 3200 3300 50  0001 C CNN
F 3 "" H 3200 3300 50  0001 C CNN
	1    3200 3300
	0    -1   -1   0   
$EndComp
$Comp
L power:VCC #PWR015
U 1 1 60A6B075
P 4850 5250
F 0 "#PWR015" H 4850 5100 50  0001 C CNN
F 1 "VCC" V 4865 5378 50  0000 L CNN
F 2 "" H 4850 5250 50  0001 C CNN
F 3 "" H 4850 5250 50  0001 C CNN
	1    4850 5250
	0    1    1    0   
$EndComp
$Comp
L power:+3.3V #PWR013
U 1 1 60A6CDA5
P 4050 5250
F 0 "#PWR013" H 4050 5100 50  0001 C CNN
F 1 "+3.3V" V 4065 5378 50  0000 L CNN
F 2 "" H 4050 5250 50  0001 C CNN
F 3 "" H 4050 5250 50  0001 C CNN
	1    4050 5250
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C3
U 1 1 60A6E1D5
P 4800 5100
F 0 "C3" H 4915 5146 50  0000 L CNN
F 1 "1uF" H 4915 5055 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.0mm_W1.6mm_P2.50mm" H 4838 4950 50  0001 C CNN
F 3 "~" H 4800 5100 50  0001 C CNN
	1    4800 5100
	1    0    0    -1  
$EndComp
$Comp
L Device:C C2
U 1 1 60A6FB20
P 4100 5100
F 0 "C2" H 3900 5150 50  0000 L CNN
F 1 "1uF" H 3850 5050 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.0mm_W1.6mm_P2.50mm" H 4138 4950 50  0001 C CNN
F 3 "~" H 4100 5100 50  0001 C CNN
	1    4100 5100
	1    0    0    -1  
$EndComp
Wire Wire Line
	4050 5250 4100 5250
Connection ~ 4100 5250
Wire Wire Line
	4100 5250 4150 5250
Wire Wire Line
	4750 5250 4800 5250
Connection ~ 4800 5250
Wire Wire Line
	4800 5250 4850 5250
Wire Wire Line
	4100 4950 4450 4950
Connection ~ 4450 4950
Wire Wire Line
	4450 4950 4800 4950
$Comp
L power:GND #PWR014
U 1 1 60A70CA4
P 4450 4950
F 0 "#PWR014" H 4450 4700 50  0001 C CNN
F 1 "GND" H 4455 4777 50  0000 C CNN
F 2 "" H 4450 4950 50  0001 C CNN
F 3 "" H 4450 4950 50  0001 C CNN
	1    4450 4950
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR06
U 1 1 60A7E62F
P 3050 5250
F 0 "#PWR06" H 3050 5000 50  0001 C CNN
F 1 "GND" V 3055 5122 50  0000 R CNN
F 2 "" H 3050 5250 50  0001 C CNN
F 3 "" H 3050 5250 50  0001 C CNN
	1    3050 5250
	0    1    1    0   
$EndComp
$Comp
L power:+3.3V #PWR05
U 1 1 60A7F743
P 3050 5150
F 0 "#PWR05" H 3050 5000 50  0001 C CNN
F 1 "+3.3V" V 3065 5278 50  0000 L CNN
F 2 "" H 3050 5150 50  0001 C CNN
F 3 "" H 3050 5150 50  0001 C CNN
	1    3050 5150
	0    -1   -1   0   
$EndComp
$Comp
L Connector:Conn_01x04_Female J2
U 1 1 60A81908
P 4700 3200
F 0 "J2" H 4728 3176 50  0000 L CNN
F 1 "PinHeader_Female_MS5803" H 4728 3085 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x04_P2.54mm_Vertical" H 4700 3200 50  0001 C CNN
F 3 "~" H 4700 3200 50  0001 C CNN
	1    4700 3200
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Female J1
U 1 1 60A7261D
P 3250 5150
F 0 "J1" H 3100 5250 50  0000 L CNN
F 1 "JST_Power_Connector_Female" H 2550 4950 50  0000 L CNN
F 2 "Connector_JST:JST_PH_S2B-PH-K_1x02_P2.00mm_Horizontal" H 3250 5150 50  0001 C CNN
F 3 "~" H 3250 5150 50  0001 C CNN
	1    3250 5150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR011
U 1 1 60A83F38
P 4500 3100
F 0 "#PWR011" H 4500 2850 50  0001 C CNN
F 1 "GND" V 4505 2972 50  0000 R CNN
F 2 "" H 4500 3100 50  0001 C CNN
F 3 "" H 4500 3100 50  0001 C CNN
	1    4500 3100
	0    1    1    0   
$EndComp
$Comp
L power:VCC #PWR012
U 1 1 60A85149
P 4500 3200
F 0 "#PWR012" H 4500 3050 50  0001 C CNN
F 1 "VCC" V 4515 3327 50  0000 L CNN
F 2 "" H 4500 3200 50  0001 C CNN
F 3 "" H 4500 3200 50  0001 C CNN
	1    4500 3200
	0    -1   -1   0   
$EndComp
Text GLabel 4500 3400 0    50   Input ~ 0
SCL
Text GLabel 4500 3300 0    50   Input ~ 0
SDA
$Comp
L Connector:Conn_01x03_Female J3
U 1 1 60D1532C
P 4750 4100
F 0 "J3" H 4778 4126 50  0000 L CNN
F 1 "PinHeader_Female_Serial" H 4778 4035 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x03_P2.54mm_Vertical" H 4750 4100 50  0001 C CNN
F 3 "~" H 4750 4100 50  0001 C CNN
	1    4750 4100
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1
U 1 1 60D18118
P 3250 2700
F 0 "C1" V 3300 2750 50  0000 L CNN
F 1 "0.1uF" V 3400 2650 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D4.3mm_W1.9mm_P5.00mm" H 3288 2550 50  0001 C CNN
F 3 "~" H 3250 2700 50  0001 C CNN
	1    3250 2700
	0    1    1    0   
$EndComp
Wire Wire Line
	2600 2700 2950 2700
Connection ~ 2950 2700
Wire Wire Line
	2950 2700 3100 2700
Text GLabel 3400 2700 2    50   Input ~ 0
~RESET
Text GLabel 4550 4200 0    50   Input ~ 0
~RESET
Text GLabel 4550 4100 0    50   Input ~ 0
RX
Text GLabel 4550 4000 0    50   Input ~ 0
TX
Text GLabel 2600 2900 2    50   Input ~ 0
TX
Text GLabel 2600 3000 2    50   Input ~ 0
RX
$Comp
L Device:R R1
U 1 1 60A65BD9
P 3050 3300
F 0 "R1" V 2950 3350 50  0000 C CNN
F 1 "220" V 3050 3300 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P25.40mm_Horizontal" V 2980 3300 50  0001 C CNN
F 3 "~" H 3050 3300 50  0001 C CNN
	1    3050 3300
	0    1    1    0   
$EndComp
$Comp
L Regulator_Linear:MCP1700-3002E_TO92 U2
U 1 1 60D54F28
P 4450 5250
F 0 "U2" H 4450 5101 50  0000 C CNN
F 1 "MCP1700-3002E_TO92" H 4450 5010 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline_Wide" H 4450 5050 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/20001826D.pdf" H 4450 5250 50  0001 C CNN
	1    4450 5250
	1    0    0    -1  
$EndComp
$EndSCHEMATC
