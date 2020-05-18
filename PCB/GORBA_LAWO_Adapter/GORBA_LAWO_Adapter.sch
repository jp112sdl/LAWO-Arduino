EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Connector_Generic:Conn_02x25_Odd_Even J1
U 1 1 5EABA565
P 4760 3940
F 0 "J1" H 4810 5357 50  0000 C CNN
F 1 "LAWO Controller" H 4810 5266 50  0000 C CNN
F 2 "Connect:IDC_Header_Straight_50pins" H 4760 3940 50  0001 C CNN
F 3 "~" H 4760 3940 50  0001 C CNN
	1    4760 3940
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x13_Odd_Even J2
U 1 1 5EA9D249
P 2600 3990
F 0 "J2" V 2696 3302 50  0000 R CNN
F 1 "Rücksetzen" V 2605 3302 50  0000 R CNN
F 2 "Connect:IDC_Header_Straight_26pins" H 2600 3990 50  0001 C CNN
F 3 "~" H 2600 3990 50  0001 C CNN
	1    2600 3990
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_02x08_Odd_Even J4
U 1 1 5EAA0BC8
P 2460 2820
F 0 "J4" V 2556 2332 50  0000 R CNN
F 1 "Control" V 2465 2332 50  0000 R CNN
F 2 "Connect:IDC_Header_Straight_16pins" H 2460 2820 50  0001 C CNN
F 3 "~" H 2460 2820 50  0001 C CNN
	1    2460 2820
	0    -1   -1   0   
$EndComp
NoConn ~ 2100 4190
NoConn ~ 2200 4190
NoConn ~ 2300 4190
NoConn ~ 2400 4190
NoConn ~ 2500 4190
NoConn ~ 2600 4190
NoConn ~ 2700 4190
NoConn ~ 2800 4190
NoConn ~ 2900 4190
NoConn ~ 2650 5270
NoConn ~ 2750 5270
NoConn ~ 2850 5270
NoConn ~ 2950 5270
NoConn ~ 3050 5270
NoConn ~ 3150 5270
NoConn ~ 3250 5270
NoConn ~ 3350 5270
NoConn ~ 3450 5270
NoConn ~ 2660 2520
NoConn ~ 2760 2520
NoConn ~ 2860 2520
Text Label 3550 5270 3    50   ~ 0
VS
$Comp
L Connector_Generic:Conn_02x13_Odd_Even J3
U 1 1 5EA9EEBC
P 2950 5070
F 0 "J3" V 3046 4382 50  0000 R CNN
F 1 "Setzen" V 2955 4382 50  0000 R CNN
F 2 "Connect:IDC_Header_Straight_26pins" H 2950 5070 50  0001 C CNN
F 3 "~" H 2950 5070 50  0001 C CNN
	1    2950 5070
	0    -1   -1   0   
$EndComp
Text Label 4560 2740 2    50   ~ 0
VS
Text Label 5060 2740 0    50   ~ 0
VS
$Comp
L power:GND #PWR02
U 1 1 5EAC186C
P 2560 3020
F 0 "#PWR02" H 2560 2770 50  0001 C CNN
F 1 "GND" H 2565 2847 50  0000 C CNN
F 2 "" H 2560 3020 50  0001 C CNN
F 3 "" H 2560 3020 50  0001 C CNN
	1    2560 3020
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR06
U 1 1 5EAC2ED9
P 5410 2840
F 0 "#PWR06" H 5410 2590 50  0001 C CNN
F 1 "GND" H 5415 2667 50  0000 C CNN
F 2 "" H 5410 2840 50  0001 C CNN
F 3 "" H 5410 2840 50  0001 C CNN
	1    5410 2840
	-1   0    0    1   
$EndComp
Wire Wire Line
	5060 2840 5410 2840
$Comp
L power:+5V #PWR01
U 1 1 5EAC5575
P 2460 3020
F 0 "#PWR01" H 2460 2870 50  0001 C CNN
F 1 "+5V" H 2475 3193 50  0000 C CNN
F 2 "" H 2460 3020 50  0001 C CNN
F 3 "" H 2460 3020 50  0001 C CNN
	1    2460 3020
	-1   0    0    1   
$EndComp
$Comp
L power:+5V #PWR04
U 1 1 5EAC671D
P 4560 2940
F 0 "#PWR04" H 4560 2790 50  0001 C CNN
F 1 "+5V" V 4575 3068 50  0000 L CNN
F 2 "" H 4560 2940 50  0001 C CNN
F 3 "" H 4560 2940 50  0001 C CNN
	1    4560 2940
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4330 2840 4560 2840
$Comp
L power:GND #PWR03
U 1 1 5EAC1E90
P 4330 2840
F 0 "#PWR03" H 4330 2590 50  0001 C CNN
F 1 "GND" H 4335 2667 50  0000 C CNN
F 2 "" H 4330 2840 50  0001 C CNN
F 3 "" H 4330 2840 50  0001 C CNN
	1    4330 2840
	-1   0    0    1   
$EndComp
$Comp
L power:+5V #PWR05
U 1 1 5EAC7D47
P 5060 2940
F 0 "#PWR05" H 5060 2790 50  0001 C CNN
F 1 "+5V" V 5075 3068 50  0000 L CNN
F 2 "" H 5060 2940 50  0001 C CNN
F 3 "" H 5060 2940 50  0001 C CNN
	1    5060 2940
	0    1    1    0   
$EndComp
$Comp
L Device:R R3
U 1 1 5EACD319
P 1360 2290
F 0 "R3" V 1280 2290 50  0000 C CNN
F 1 "15k" V 1360 2300 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 1290 2290 50  0001 C CNN
F 3 "~" H 1360 2290 50  0001 C CNN
	1    1360 2290
	1    0    0    -1  
$EndComp
$Comp
L Device:R R5
U 1 1 5EACE141
P 1910 2040
F 0 "R5" V 1830 2040 50  0000 C CNN
F 1 "15k" V 1910 2040 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 1840 2040 50  0001 C CNN
F 3 "~" H 1910 2040 50  0001 C CNN
	1    1910 2040
	1    0    0    -1  
$EndComp
$Comp
L Device:C C3
U 1 1 5EACE775
P 1360 1990
F 0 "C3" H 1230 2140 50  0000 C CNN
F 1 "0.33µ" H 1250 2080 50  0000 C CNN
F 2 "Capacitor_THT:C_Rect_L10.0mm_W4.0mm_P7.50mm_MKS4" H 1398 1840 50  0001 C CNN
F 3 "~" H 1360 1990 50  0001 C CNN
	1    1360 1990
	1    0    0    -1  
$EndComp
$Comp
L Device:C C5
U 1 1 5EACED6F
P 1910 1740
F 0 "C5" H 1780 1890 50  0000 C CNN
F 1 "0.33µ" H 1800 1830 50  0000 C CNN
F 2 "Capacitor_THT:C_Rect_L10.0mm_W4.0mm_P7.50mm_MKS4" H 1948 1590 50  0001 C CNN
F 3 "~" H 1910 1740 50  0001 C CNN
	1    1910 1740
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1
U 1 1 5EAC9BAB
P 810 2170
F 0 "C1" H 680 2330 50  0000 C CNN
F 1 "0.33µ" H 700 2260 50  0000 C CNN
F 2 "Capacitor_THT:C_Rect_L10.0mm_W4.0mm_P7.50mm_MKS4" H 848 2020 50  0001 C CNN
F 3 "~" H 810 2170 50  0001 C CNN
	1    810  2170
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 5EAC8FFE
P 810 2470
F 0 "R1" V 730 2480 50  0000 C CNN
F 1 "15k" V 810 2480 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 740 2470 50  0001 C CNN
F 3 "~" H 810 2470 50  0001 C CNN
	1    810  2470
	1    0    0    -1  
$EndComp
$Comp
L Device:C C2
U 1 1 5EACE48F
P 1070 2070
F 0 "C2" H 950 2230 50  0000 C CNN
F 1 "0.33µ" H 970 2160 50  0000 C CNN
F 2 "Capacitor_THT:C_Rect_L10.0mm_W4.0mm_P7.50mm_MKS4" H 1108 1920 50  0001 C CNN
F 3 "~" H 1070 2070 50  0001 C CNN
	1    1070 2070
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 5EACCDD3
P 1070 2370
F 0 "R2" V 990 2370 50  0000 C CNN
F 1 "15k" V 1070 2380 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 1000 2370 50  0001 C CNN
F 3 "~" H 1070 2370 50  0001 C CNN
	1    1070 2370
	1    0    0    -1  
$EndComp
Wire Wire Line
	1910 1890 2560 1890
Connection ~ 1910 1890
Wire Wire Line
	2560 1890 2560 2520
Wire Wire Line
	2460 2040 2460 2520
Wire Wire Line
	2360 2140 2360 2520
Connection ~ 1360 2140
Wire Wire Line
	2160 2320 2160 2520
Connection ~ 810  2320
Wire Wire Line
	2260 2220 2260 2520
Connection ~ 1070 2220
$Comp
L Connector_Generic:Conn_01x01 J5
U 1 1 5EB01CA5
P 1910 1390
F 0 "J5" V 1874 1302 50  0000 R CNN
F 1 "E5" V 1783 1302 50  0000 R CNN
F 2 "Connector_PinHeader_1.00mm:PinHeader_1x01_P1.00mm_Vertical" H 1910 1390 50  0001 C CNN
F 3 "~" H 1910 1390 50  0001 C CNN
	1    1910 1390
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1070 2220 2260 2220
Wire Wire Line
	810  2320 2160 2320
Wire Wire Line
	1360 2140 2360 2140
$Comp
L Device:R R4
U 1 1 5EACDFD6
P 1640 2190
F 0 "R4" V 1560 2190 50  0000 C CNN
F 1 "15k" V 1640 2190 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 1570 2190 50  0001 C CNN
F 3 "~" H 1640 2190 50  0001 C CNN
	1    1640 2190
	1    0    0    -1  
$EndComp
Connection ~ 1640 2040
Wire Wire Line
	1640 2040 2460 2040
$Comp
L Device:C C4
U 1 1 5EACEAA0
P 1640 1890
F 0 "C4" H 1520 2040 50  0000 C CNN
F 1 "0.33µ" H 1530 1980 50  0000 C CNN
F 2 "Capacitor_THT:C_Rect_L10.0mm_W4.0mm_P7.50mm_MKS4" H 1678 1740 50  0001 C CNN
F 3 "~" H 1640 1890 50  0001 C CNN
	1    1640 1890
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0101
U 1 1 5EB0C361
P 810 2620
F 0 "#PWR0101" H 810 2370 50  0001 C CNN
F 1 "GND" H 815 2447 50  0000 C CNN
F 2 "" H 810 2620 50  0001 C CNN
F 3 "" H 810 2620 50  0001 C CNN
	1    810  2620
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 5EB0C9B1
P 1070 2520
F 0 "#PWR0102" H 1070 2270 50  0001 C CNN
F 1 "GND" H 1075 2347 50  0000 C CNN
F 2 "" H 1070 2520 50  0001 C CNN
F 3 "" H 1070 2520 50  0001 C CNN
	1    1070 2520
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0103
U 1 1 5EB0CD6A
P 1360 2440
F 0 "#PWR0103" H 1360 2190 50  0001 C CNN
F 1 "GND" H 1365 2267 50  0000 C CNN
F 2 "" H 1360 2440 50  0001 C CNN
F 3 "" H 1360 2440 50  0001 C CNN
	1    1360 2440
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0104
U 1 1 5EB0D134
P 1640 2340
F 0 "#PWR0104" H 1640 2090 50  0001 C CNN
F 1 "GND" H 1645 2167 50  0000 C CNN
F 2 "" H 1640 2340 50  0001 C CNN
F 3 "" H 1640 2340 50  0001 C CNN
	1    1640 2340
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0105
U 1 1 5EB0D586
P 1910 2190
F 0 "#PWR0105" H 1910 1940 50  0001 C CNN
F 1 "GND" H 1915 2017 50  0000 C CNN
F 2 "" H 1910 2190 50  0001 C CNN
F 3 "" H 1910 2190 50  0001 C CNN
	1    1910 2190
	1    0    0    -1  
$EndComp
Text Label 810  2020 1    50   ~ 0
E1
Text Label 1070 1920 1    50   ~ 0
E2
Text Label 1360 1840 1    50   ~ 0
E3
Text Label 1640 1740 1    50   ~ 0
E4
Text Label 4560 3040 2    50   ~ 0
E1
Text Label 4560 3140 2    50   ~ 0
E3
Text Label 5060 3040 0    50   ~ 0
E4
Text Label 5060 3140 0    50   ~ 0
E2
Text Label 2660 3020 3    50   ~ 0
D
Text Label 4560 3340 2    50   ~ 0
D
Text Label 2160 3020 3    50   ~ 0
COL_A0
Text Label 2260 3020 3    50   ~ 0
COL_A2
Text Label 2360 3020 3    50   ~ 0
COL_A1
Text Label 2760 3020 3    50   ~ 0
COL_A4
Text Label 2860 3020 3    50   ~ 0
COL_A3
Text Label 4560 3240 2    50   ~ 0
COL_A4
Text Label 4560 3440 2    50   ~ 0
COL_A1
Text Label 5060 3240 0    50   ~ 0
COL_A3
Text Label 5060 3340 0    50   ~ 0
COL_A2
Text Label 5060 3440 0    50   ~ 0
COL_A0
$Comp
L power:GND #PWR0106
U 1 1 5EB0FD81
P 5560 3540
F 0 "#PWR0106" H 5560 3290 50  0001 C CNN
F 1 "GND" H 5565 3367 50  0000 C CNN
F 2 "" H 5560 3540 50  0001 C CNN
F 3 "" H 5560 3540 50  0001 C CNN
	1    5560 3540
	-1   0    0    1   
$EndComp
Wire Wire Line
	5060 3540 5560 3540
$Comp
L power:GND #PWR0107
U 1 1 5EB11DE3
P 4180 3540
F 0 "#PWR0107" H 4180 3290 50  0001 C CNN
F 1 "GND" H 4185 3367 50  0000 C CNN
F 2 "" H 4180 3540 50  0001 C CNN
F 3 "" H 4180 3540 50  0001 C CNN
	1    4180 3540
	-1   0    0    1   
$EndComp
Wire Wire Line
	4560 3540 4180 3540
Text Label 3550 4770 1    50   ~ 0
Y_R2
Text Label 3450 4770 1    50   ~ 0
Y_R1
Text Label 3350 4770 1    50   ~ 0
Y_R4
Text Label 3250 4770 1    50   ~ 0
Y_R3
Text Label 3150 4770 1    50   ~ 0
Y_R6
Text Label 3050 4770 1    50   ~ 0
Y_R5
Text Label 2950 4770 1    50   ~ 0
Y_R8
Text Label 2850 4770 1    50   ~ 0
Y_R7
Text Label 2750 4770 1    50   ~ 0
Y_R10
Text Label 2650 4770 1    50   ~ 0
Y_R9
Text Label 2550 4770 1    50   ~ 0
Y_R12
Text Label 2450 4770 1    50   ~ 0
Y_R11
Text Label 2350 4770 1    50   ~ 0
Y_R14
Text Label 2350 5270 3    50   ~ 0
Y_R13
Text Label 2450 5270 3    50   ~ 0
Y_R16
Text Label 2550 5270 3    50   ~ 0
Y_R15
Text Label 5060 3640 0    50   ~ 0
Y_R1
Text Label 5060 3740 0    50   ~ 0
Y_R2
Text Label 5060 3840 0    50   ~ 0
Y_R3
Text Label 5060 4040 0    50   ~ 0
Y_R5
Text Label 5060 4140 0    50   ~ 0
Y_R6
Text Label 5060 4240 0    50   ~ 0
Y_R7
Text Label 5060 4340 0    50   ~ 0
Y_R8
Text Label 5060 4440 0    50   ~ 0
Y_R9
Text Label 5060 4540 0    50   ~ 0
Y_R10
Text Label 5060 4640 0    50   ~ 0
Y_R11
Text Label 5060 4740 0    50   ~ 0
Y_R12
Text Label 5060 4840 0    50   ~ 0
Y_R13
Text Label 5060 4940 0    50   ~ 0
Y_R14
Text Label 5060 5040 0    50   ~ 0
Y_R15
Text Label 5060 5140 0    50   ~ 0
Y_R16
Text Label 5060 3940 0    50   ~ 0
Y_R4
Text Label 4560 3640 2    50   ~ 0
B_R1
Text Label 4560 3840 2    50   ~ 0
B_R3
Text Label 4560 3940 2    50   ~ 0
B_R4
Text Label 4560 4040 2    50   ~ 0
B_R5
Text Label 4560 4340 2    50   ~ 0
B_R8
Text Label 4560 4540 2    50   ~ 0
B_R10
Text Label 4560 4640 2    50   ~ 0
B_R11
Text Label 4560 4740 2    50   ~ 0
B_R12
Text Label 4560 4840 2    50   ~ 0
B_R13
Text Label 4560 4940 2    50   ~ 0
B_R14
Text Label 4560 5140 2    50   ~ 0
B_R16
Text Label 4560 3740 2    50   ~ 0
B_R2
Text Label 3200 4190 3    50   ~ 0
B_R13
Text Label 3100 4190 3    50   ~ 0
B_R16
Text Label 4560 5040 2    50   ~ 0
B_R15
Text Label 3000 4190 3    50   ~ 0
B_R15
Text Label 3200 3690 1    50   ~ 0
B_R14
Text Label 3100 3690 1    50   ~ 0
B_R11
Text Label 3000 3690 1    50   ~ 0
B_R12
Text Label 2000 3690 1    50   ~ 0
B_R2
Text Label 2100 3690 1    50   ~ 0
B_R1
Text Label 2200 3690 1    50   ~ 0
B_R4
Text Label 4560 4140 2    50   ~ 0
B_R6
Text Label 2400 3690 1    50   ~ 0
B_R6
Text Label 2600 3690 1    50   ~ 0
B_R8
Text Label 2800 3690 1    50   ~ 0
B_R10
Text Label 2300 3690 1    50   ~ 0
B_R3
Text Label 2500 3690 1    50   ~ 0
B_R5
Text Label 4560 4240 2    50   ~ 0
B_R7
Text Label 2700 3690 1    50   ~ 0
B_R7
Text Label 4560 4440 2    50   ~ 0
B_R9
Text Label 2900 3690 1    50   ~ 0
B_R9
$Comp
L Mechanical:MountingHole H4
U 1 1 5EB4FE35
P 3270 1670
F 0 "H4" H 3370 1716 50  0000 L CNN
F 1 "MountingHole" H 3370 1625 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.7mm_Pad" H 3270 1670 50  0001 C CNN
F 3 "~" H 3270 1670 50  0001 C CNN
	1    3270 1670
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H3
U 1 1 5EB5038B
P 3260 1480
F 0 "H3" H 3360 1526 50  0000 L CNN
F 1 "MountingHole" H 3360 1435 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.7mm_Pad" H 3260 1480 50  0001 C CNN
F 3 "~" H 3260 1480 50  0001 C CNN
	1    3260 1480
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H1
U 1 1 5EB50BEF
P 3260 1100
F 0 "H1" H 3360 1146 50  0000 L CNN
F 1 "MountingHole" H 3360 1055 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.7mm_Pad" H 3260 1100 50  0001 C CNN
F 3 "~" H 3260 1100 50  0001 C CNN
	1    3260 1100
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H2
U 1 1 5EB50E59
P 3260 1290
F 0 "H2" H 3360 1336 50  0000 L CNN
F 1 "MountingHole" H 3360 1245 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.7mm_Pad" H 3260 1290 50  0001 C CNN
F 3 "~" H 3260 1290 50  0001 C CNN
	1    3260 1290
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG0101
U 1 1 5EB61956
P 5560 3540
F 0 "#FLG0101" H 5560 3615 50  0001 C CNN
F 1 "PWR_FLAG" H 5560 3713 50  0000 C CNN
F 2 "" H 5560 3540 50  0001 C CNN
F 3 "~" H 5560 3540 50  0001 C CNN
	1    5560 3540
	-1   0    0    1   
$EndComp
Connection ~ 5560 3540
$Comp
L power:PWR_FLAG #FLG0102
U 1 1 5EB626AD
P 5060 2940
F 0 "#FLG0102" H 5060 3015 50  0001 C CNN
F 1 "PWR_FLAG" H 5060 3113 50  0001 C CNN
F 2 "" H 5060 2940 50  0001 C CNN
F 3 "~" H 5060 2940 50  0001 C CNN
	1    5060 2940
	1    0    0    -1  
$EndComp
Connection ~ 5060 2940
$Comp
L power:GND #PWR0108
U 1 1 5EAAB469
P 2000 4190
F 0 "#PWR0108" H 2000 3940 50  0001 C CNN
F 1 "GND" H 2005 4017 50  0000 C CNN
F 2 "" H 2000 4190 50  0001 C CNN
F 3 "" H 2000 4190 50  0001 C CNN
	1    2000 4190
	1    0    0    -1  
$EndComp
$EndSCHEMATC
