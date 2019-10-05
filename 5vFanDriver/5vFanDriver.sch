EESchema Schematic File Version 4
LIBS:5vFanDriver-cache
EELAYER 26 0
EELAYER END
$Descr User 5906 4724
encoding utf-8
Sheet 1 1
Title "5V RAMPS FAN PWM Extender"
Date "2019-04-22"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Transistor_BJT:2N3904 Q1
U 1 1 5CBB70FD
P 2600 1300
F 0 "Q1" H 2791 1346 50  0000 L CNN
F 1 "2N3904" H 2791 1255 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_HandSolder" H 2800 1225 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N3904.pdf" H 2600 1300 50  0001 L CNN
	1    2600 1300
	1    0    0    -1  
$EndComp
$Comp
L Transistor_BJT:2N3906 Q3
U 1 1 5CBB7228
P 3600 1100
F 0 "Q3" H 3791 1146 50  0000 L CNN
F 1 "2N3906" H 3791 1055 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_HandSolder" H 3800 1025 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N3906.pdf" H 3600 1100 50  0001 L CNN
	1    3600 1100
	1    0    0    -1  
$EndComp
$Comp
L Device:R R3
U 1 1 5CBB7396
P 3200 1100
F 0 "R3" V 2993 1100 50  0000 C CNN
F 1 "100" V 3084 1100 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P2.54mm_Vertical" V 3130 1100 50  0001 C CNN
F 3 "~" H 3200 1100 50  0001 C CNN
	1    3200 1100
	0    1    1    0   
$EndComp
$Comp
L Device:R R1
U 1 1 5CBB746F
P 2050 1300
F 0 "R1" V 1843 1300 50  0000 C CNN
F 1 "1k" V 1934 1300 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P2.54mm_Vertical" V 1980 1300 50  0001 C CNN
F 3 "~" H 2050 1300 50  0001 C CNN
	1    2050 1300
	0    1    1    0   
$EndComp
Wire Wire Line
	2200 1300 2400 1300
Wire Wire Line
	2700 1100 3050 1100
Wire Wire Line
	3350 1100 3400 1100
$Comp
L Connector:Conn_01x04_Male J2
U 1 1 5CBB7A65
P 4350 1700
F 0 "J2" H 4323 1580 50  0000 R CNN
F 1 "Conn_01x04_Male" H 4323 1671 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 4350 1700 50  0001 C CNN
F 3 "~" H 4350 1700 50  0001 C CNN
	1    4350 1700
	-1   0    0    1   
$EndComp
Wire Wire Line
	3700 1300 3700 1500
Wire Wire Line
	3700 1500 4150 1500
Wire Wire Line
	4150 1600 4150 1700
Wire Wire Line
	4150 1700 2700 1700
Wire Wire Line
	2700 1700 2700 1500
Connection ~ 4150 1700
Connection ~ 2700 1700
Wire Wire Line
	3700 900  3700 800 
Wire Wire Line
	3700 800  3950 800 
$Comp
L Device:R R4
U 1 1 5CBE06EC
P 3200 2200
F 0 "R4" V 2993 2200 50  0000 C CNN
F 1 "100" V 3084 2200 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P2.54mm_Vertical" V 3130 2200 50  0001 C CNN
F 3 "~" H 3200 2200 50  0001 C CNN
	1    3200 2200
	0    1    1    0   
$EndComp
$Comp
L Transistor_BJT:2N3906 Q4
U 1 1 5CBE074C
P 3600 2200
F 0 "Q4" H 3791 2246 50  0000 L CNN
F 1 "2N3906" H 3791 2155 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_HandSolder" H 3800 2125 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N3906.pdf" H 3600 2200 50  0001 L CNN
	1    3600 2200
	1    0    0    1   
$EndComp
$Comp
L Transistor_BJT:2N3904 Q2
U 1 1 5CBE07A2
P 2600 2000
F 0 "Q2" H 2791 2046 50  0000 L CNN
F 1 "2N3904" H 2791 1955 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_HandSolder" H 2800 1925 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N3904.pdf" H 2600 2000 50  0001 L CNN
	1    2600 2000
	1    0    0    1   
$EndComp
$Comp
L Device:R R2
U 1 1 5CBE0932
P 2050 2000
F 0 "R2" V 1843 2000 50  0000 C CNN
F 1 "1k" V 1934 2000 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P2.54mm_Vertical" V 1980 2000 50  0001 C CNN
F 3 "~" H 2050 2000 50  0001 C CNN
	1    2050 2000
	0    1    1    0   
$EndComp
Wire Wire Line
	2200 2000 2400 2000
Wire Wire Line
	2700 1800 2700 1700
Wire Wire Line
	2700 2200 3050 2200
Wire Wire Line
	3350 2200 3400 2200
Wire Wire Line
	3700 2000 3700 1800
Wire Wire Line
	3700 1800 4150 1800
Wire Wire Line
	3950 2500 3950 800 
Wire Wire Line
	3950 2500 3700 2500
Wire Wire Line
	3700 2500 3700 2400
$Comp
L Connector_Generic:Conn_02x03_Odd_Even J1
U 1 1 5CBE3D75
P 1200 1400
F 0 "J1" H 1250 1075 50  0000 C CNN
F 1 "Conn_02x03_Odd_Even" H 1250 1166 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x03_P2.54mm_Vertical" H 1200 1400 50  0001 C CNN
F 3 "~" H 1200 1400 50  0001 C CNN
	1    1200 1400
	1    0    0    1   
$EndComp
Wire Wire Line
	3700 800  700  800 
Connection ~ 3700 800 
Wire Wire Line
	700  800  700  1400
Wire Wire Line
	1500 1300 1900 1300
Wire Wire Line
	1000 1300 850  1300
Wire Wire Line
	850  1300 850  2000
Wire Wire Line
	850  2000 1900 2000
Wire Wire Line
	1500 1700 2700 1700
Wire Wire Line
	1500 1500 1500 1700
NoConn ~ 1500 1400
NoConn ~ 1000 1500
Wire Wire Line
	700  1400 1000 1400
$EndSCHEMATC
