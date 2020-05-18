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
F 2 "Connector_IDC:IDC-Header_2x25_P2.54mm_Vertical" H 4760 3940 50  0001 C CNN
F 3 "~" H 4760 3940 50  0001 C CNN
	1    4760 3940
	1    0    0    -1  
$EndComp
Text Label 4560 2740 2    50   ~ 0
VS
Text Label 5060 2740 0    50   ~ 0
VS
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
Text Label 4560 3040 2    50   ~ 0
E1
Text Label 4560 3140 2    50   ~ 0
E3
Text Label 5060 3040 0    50   ~ 0
E4
Text Label 5060 3140 0    50   ~ 0
E2
Text Label 4560 3340 2    50   ~ 0
D
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
Text Label 4560 5040 2    50   ~ 0
B_R15
Text Label 4560 4140 2    50   ~ 0
B_R6
Text Label 4560 4240 2    50   ~ 0
B_R7
Text Label 4560 4440 2    50   ~ 0
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
Text Label 1990 2520 2    50   ~ 0
Y_R1
Text Label 2490 2520 0    50   ~ 0
Y_R2
Text Label 2490 2620 0    50   ~ 0
Y_R4
Text Label 2490 2720 0    50   ~ 0
Y_R6
Text Label 2490 2820 0    50   ~ 0
Y_R8
Text Label 2490 2920 0    50   ~ 0
Y_R10
Text Label 2490 3020 0    50   ~ 0
Y_R12
Text Label 2490 3120 0    50   ~ 0
Y_R14
Text Label 2490 3220 0    50   ~ 0
Y_R16
Text Label 1990 2620 2    50   ~ 0
Y_R3
Text Label 1990 2720 2    50   ~ 0
Y_R5
Text Label 1990 2820 2    50   ~ 0
Y_R7
Text Label 1990 2920 2    50   ~ 0
Y_R9
Text Label 1990 3020 2    50   ~ 0
Y_R11
Text Label 1990 3120 2    50   ~ 0
Y_R13
Text Label 1990 3220 2    50   ~ 0
Y_R15
Text Label 1990 3520 2    50   ~ 0
B_R1
Text Label 4560 3840 2    50   ~ 0
B_R3
Text Label 1990 3620 2    50   ~ 0
B_R3
Text Label 1990 3720 2    50   ~ 0
B_R5
Text Label 1990 3820 2    50   ~ 0
B_R7
Text Label 1990 3920 2    50   ~ 0
B_R9
Text Label 1990 4020 2    50   ~ 0
B_R11
Text Label 1990 4120 2    50   ~ 0
B_R13
Text Label 1990 4220 2    50   ~ 0
B_R15
Text Label 2490 3520 0    50   ~ 0
B_R2
$Comp
L Connector_Generic:Conn_02x30_Odd_Even J2
U 1 1 5EBE9602
P 2190 3920
F 0 "J2" H 2240 5537 50  0000 C CNN
F 1 "BROSE" H 2240 5446 50  0000 C CNN
F 2 "Connector_IDC:IDC-Header_2x30_P2.54mm_Vertical" H 2190 3920 50  0001 C CNN
F 3 "~" H 2190 3920 50  0001 C CNN
	1    2190 3920
	1    0    0    -1  
$EndComp
Text Label 2490 3620 0    50   ~ 0
B_R4
Text Label 2490 3720 0    50   ~ 0
B_R6
Text Label 2490 3820 0    50   ~ 0
B_R8
Text Label 2490 3920 0    50   ~ 0
B_R10
Text Label 2490 4020 0    50   ~ 0
B_R12
Text Label 2490 4120 0    50   ~ 0
B_R14
Text Label 2490 4220 0    50   ~ 0
B_R16
$Comp
L power:GND #PWR01
U 1 1 5EBF62CA
P 1820 4490
F 0 "#PWR01" H 1820 4240 50  0001 C CNN
F 1 "GND" H 1825 4317 50  0000 C CNN
F 2 "" H 1820 4490 50  0001 C CNN
F 3 "" H 1820 4490 50  0001 C CNN
	1    1820 4490
	-1   0    0    1   
$EndComp
Wire Wire Line
	1990 4520 1820 4520
Wire Wire Line
	1820 4520 1820 4490
Text Label 2490 4620 0    50   ~ 0
VS
$Comp
L Connector:Conn_01x01_Male J3
U 1 1 5EBF791C
P 2690 4520
F 0 "J3" H 2662 4452 50  0000 R CNN
F 1 "24V" H 2662 4543 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x01_P2.54mm_Vertical" H 2690 4520 50  0001 C CNN
F 3 "~" H 2690 4520 50  0001 C CNN
	1    2690 4520
	-1   0    0    1   
$EndComp
Wire Wire Line
	1990 4620 1990 4540
Wire Wire Line
	1990 4540 2490 4540
Wire Wire Line
	2490 4540 2490 4520
Connection ~ 2490 4520
NoConn ~ 1990 3320
NoConn ~ 1990 3420
NoConn ~ 2490 3420
NoConn ~ 2490 3320
NoConn ~ 2490 4320
NoConn ~ 2490 4420
NoConn ~ 1990 4420
NoConn ~ 1990 4320
NoConn ~ 2490 4720
$Comp
L power:+5V #PWR?
U 1 1 5EBFB932
P 1990 4720
F 0 "#PWR?" H 1990 4570 50  0001 C CNN
F 1 "+5V" V 2005 4848 50  0000 L CNN
F 2 "" H 1990 4720 50  0001 C CNN
F 3 "" H 1990 4720 50  0001 C CNN
	1    1990 4720
	0    -1   -1   0   
$EndComp
Text Label 1990 4820 2    50   ~ 0
D
Text Label 2490 4820 0    50   ~ 0
COL_A0
Text Label 1990 4920 2    50   ~ 0
COL_A1
Text Label 2490 4920 0    50   ~ 0
COL_A2
Text Label 1990 5020 2    50   ~ 0
COL_A3
Text Label 2490 5020 0    50   ~ 0
COL_A4
Text Label 1990 5120 2    50   ~ 0
E1
Text Label 2490 5120 0    50   ~ 0
E2
Text Label 1990 5220 2    50   ~ 0
E3
Text Label 2490 5220 0    50   ~ 0
E4
$EndSCHEMATC
