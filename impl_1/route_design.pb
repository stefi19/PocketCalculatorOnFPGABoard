
Q
Command: %s
53*	vivadotcl2 
route_design2default:defaultZ4-113h px� 
�
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2"
Implementation2default:default2
xc7a100t2default:defaultZ17-347h px� 
�
0Got license for feature '%s' and/or device '%s'
310*common2"
Implementation2default:default2
xc7a100t2default:defaultZ17-349h px� 
p
,Running DRC as a precondition to command %s
22*	vivadotcl2 
route_design2default:defaultZ4-22h px� 
P
Running DRC with %s threads
24*drc2
22default:defaultZ23-27h px� 
�
Rule violation (%s) %s - %s
20*drc2
PLIO-32default:default2B
.Placement Constraints Check for IO constraints2default:default2
kPartially locked IO Bus is found. Following components of the IO Bus anodes[3:0] are not locked:  anodes[3]2default:defaultZ23-20h px� 
�
Rule violation (%s) %s - %s
20*drc2
PLIO-32default:default2B
.Placement Constraints Check for IO constraints2default:default2�
�Partially locked IO Bus is found. Following components of the IO Bus cathodes[6:0] are not locked:  cathodes[4] cathodes[3] cathodes[1] cathodes[0]2default:defaultZ23-20h px� 
�
Rule violation (%s) %s - %s
20*drc2
PLIO-32default:default2B
.Placement Constraints Check for IO constraints2default:default2�
�Partially locked IO Bus is found. Following components of the IO Bus result_leds[8:0] are not locked:  result_leds[7] result_leds[5] result_leds[4] result_leds[3] result_leds[2] result_leds[1]2default:defaultZ23-20h px� 
�
Rule violation (%s) %s - %s
20*drc2
PLIO-32default:default2B
.Placement Constraints Check for IO constraints2default:default2�
�Partially locked IO Bus is found. Following components of the IO Bus switches[10:0] are not locked:  switches[7] switches[6] switches[4] switches[3] switches[2]2default:defaultZ23-20h px� 
b
DRC finished with %s
79*	vivadotcl2(
0 Errors, 4 Warnings2default:defaultZ4-198h px� 
e
BPlease refer to the DRC report (report_drc) for more information.
80*	vivadotclZ4-199h px� 
V

Starting %s Task
103*constraints2
Routing2default:defaultZ18-103h px� 
y
BMultithreading enabled for route_design using a maximum of %s CPUs97*route2
22default:defaultZ35-254h px� 
p

Phase %s%s
101*constraints2
1 2default:default2#
Build RT Design2default:defaultZ18-101h px� 
B
-Phase 1 Build RT Design | Checksum: f431d7fa
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:15 ; elapsed = 00:00:26 . Memory (MB): peak = 1181.344 ; gain = 159.9492default:defaulth px� 
v

Phase %s%s
101*constraints2
2 2default:default2)
Router Initialization2default:defaultZ18-101h px� 
o

Phase %s%s
101*constraints2
2.1 2default:default2 
Create Timer2default:defaultZ18-101h px� 
A
,Phase 2.1 Create Timer | Checksum: f431d7fa
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:15 ; elapsed = 00:00:26 . Memory (MB): peak = 1181.344 ; gain = 159.9492default:defaulth px� 
{

Phase %s%s
101*constraints2
2.2 2default:default2,
Fix Topology Constraints2default:defaultZ18-101h px� 
M
8Phase 2.2 Fix Topology Constraints | Checksum: f431d7fa
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:15 ; elapsed = 00:00:26 . Memory (MB): peak = 1181.344 ; gain = 159.9492default:defaulth px� 
t

Phase %s%s
101*constraints2
2.3 2default:default2%
Pre Route Cleanup2default:defaultZ18-101h px� 
F
1Phase 2.3 Pre Route Cleanup | Checksum: f431d7fa
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:15 ; elapsed = 00:00:26 . Memory (MB): peak = 1181.344 ; gain = 159.9492default:defaulth px� 
p

Phase %s%s
101*constraints2
2.4 2default:default2!
Update Timing2default:defaultZ18-101h px� 
C
.Phase 2.4 Update Timing | Checksum: 1a5202663
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:16 ; elapsed = 00:00:27 . Memory (MB): peak = 1181.344 ; gain = 159.9492default:defaulth px� 
�
Intermediate Timing Summary %s164*route2J
6| WNS=7.329  | TNS=0.000  | WHS=-0.066 | THS=-0.465 |
2default:defaultZ35-416h px� 
I
4Phase 2 Router Initialization | Checksum: 20c4c69d4
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:16 ; elapsed = 00:00:27 . Memory (MB): peak = 1181.344 ; gain = 159.9492default:defaulth px� 
p

Phase %s%s
101*constraints2
3 2default:default2#
Initial Routing2default:defaultZ18-101h px� 
C
.Phase 3 Initial Routing | Checksum: 124d7ba38
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:16 ; elapsed = 00:00:27 . Memory (MB): peak = 1181.344 ; gain = 159.9492default:defaulth px� 
s

Phase %s%s
101*constraints2
4 2default:default2&
Rip-up And Reroute2default:defaultZ18-101h px� 
u

Phase %s%s
101*constraints2
4.1 2default:default2&
Global Iteration 02default:defaultZ18-101h px� 
r

Phase %s%s
101*constraints2
4.1.1 2default:default2!
Update Timing2default:defaultZ18-101h px� 
E
0Phase 4.1.1 Update Timing | Checksum: 17b0998ce
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:16 ; elapsed = 00:00:27 . Memory (MB): peak = 1181.344 ; gain = 159.9492default:defaulth px� 
�
Intermediate Timing Summary %s164*route2J
6| WNS=6.411  | TNS=0.000  | WHS=N/A    | THS=N/A    |
2default:defaultZ35-416h px� 
H
3Phase 4.1 Global Iteration 0 | Checksum: 10b081e04
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:16 ; elapsed = 00:00:27 . Memory (MB): peak = 1181.344 ; gain = 159.9492default:defaulth px� 
F
1Phase 4 Rip-up And Reroute | Checksum: 10b081e04
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:16 ; elapsed = 00:00:27 . Memory (MB): peak = 1181.344 ; gain = 159.9492default:defaulth px� 
|

Phase %s%s
101*constraints2
5 2default:default2/
Delay and Skew Optimization2default:defaultZ18-101h px� 
p

Phase %s%s
101*constraints2
5.1 2default:default2!
Delay CleanUp2default:defaultZ18-101h px� 
r

Phase %s%s
101*constraints2
5.1.1 2default:default2!
Update Timing2default:defaultZ18-101h px� 
E
0Phase 5.1.1 Update Timing | Checksum: 12790d29d
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:16 ; elapsed = 00:00:27 . Memory (MB): peak = 1181.344 ; gain = 159.9492default:defaulth px� 
�
Intermediate Timing Summary %s164*route2J
6| WNS=6.490  | TNS=0.000  | WHS=N/A    | THS=N/A    |
2default:defaultZ35-416h px� 
C
.Phase 5.1 Delay CleanUp | Checksum: 12790d29d
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:16 ; elapsed = 00:00:27 . Memory (MB): peak = 1181.344 ; gain = 159.9492default:defaulth px� 
z

Phase %s%s
101*constraints2
5.2 2default:default2+
Clock Skew Optimization2default:defaultZ18-101h px� 
M
8Phase 5.2 Clock Skew Optimization | Checksum: 12790d29d
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:16 ; elapsed = 00:00:27 . Memory (MB): peak = 1181.344 ; gain = 159.9492default:defaulth px� 
O
:Phase 5 Delay and Skew Optimization | Checksum: 12790d29d
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:16 ; elapsed = 00:00:27 . Memory (MB): peak = 1181.344 ; gain = 159.9492default:defaulth px� 
n

Phase %s%s
101*constraints2
6 2default:default2!
Post Hold Fix2default:defaultZ18-101h px� 
p

Phase %s%s
101*constraints2
6.1 2default:default2!
Hold Fix Iter2default:defaultZ18-101h px� 
r

Phase %s%s
101*constraints2
6.1.1 2default:default2!
Update Timing2default:defaultZ18-101h px� 
D
/Phase 6.1.1 Update Timing | Checksum: e3b4583e
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:16 ; elapsed = 00:00:27 . Memory (MB): peak = 1181.344 ; gain = 159.9492default:defaulth px� 
�
Intermediate Timing Summary %s164*route2J
6| WNS=6.490  | TNS=0.000  | WHS=0.198  | THS=0.000  |
2default:defaultZ35-416h px� 
B
-Phase 6.1 Hold Fix Iter | Checksum: 94007bf4
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:16 ; elapsed = 00:00:27 . Memory (MB): peak = 1181.344 ; gain = 159.9492default:defaulth px� 
@
+Phase 6 Post Hold Fix | Checksum: 94007bf4
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:16 ; elapsed = 00:00:27 . Memory (MB): peak = 1181.344 ; gain = 159.9492default:defaulth px� 
o

Phase %s%s
101*constraints2
7 2default:default2"
Route finalize2default:defaultZ18-101h px� 
A
,Phase 7 Route finalize | Checksum: a6a8eb9f
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:16 ; elapsed = 00:00:27 . Memory (MB): peak = 1181.344 ; gain = 159.9492default:defaulth px� 
v

Phase %s%s
101*constraints2
8 2default:default2)
Verifying routed nets2default:defaultZ18-101h px� 
H
3Phase 8 Verifying routed nets | Checksum: a6a8eb9f
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:16 ; elapsed = 00:00:27 . Memory (MB): peak = 1181.344 ; gain = 159.9492default:defaulth px� 
r

Phase %s%s
101*constraints2
9 2default:default2%
Depositing Routes2default:defaultZ18-101h px� 
D
/Phase 9 Depositing Routes | Checksum: 74a331f5
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:16 ; elapsed = 00:00:27 . Memory (MB): peak = 1181.344 ; gain = 159.9492default:defaulth px� 
t

Phase %s%s
101*constraints2
10 2default:default2&
Post Router Timing2default:defaultZ18-101h px� 
�
Estimated Timing Summary %s
57*route2J
6| WNS=6.490  | TNS=0.000  | WHS=0.198  | THS=0.000  |
2default:defaultZ35-57h px� 
�
�The final timing numbers are based on the router estimated timing analysis. For a complete and accurate timing signoff, please run report_timing_summary.
127*routeZ35-327h px� 
F
1Phase 10 Post Router Timing | Checksum: 74a331f5
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:16 ; elapsed = 00:00:27 . Memory (MB): peak = 1181.344 ; gain = 159.9492default:defaulth px� 
=
Router Completed Successfully
16*routeZ35-16h px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:16 ; elapsed = 00:00:27 . Memory (MB): peak = 1181.344 ; gain = 159.9492default:defaulth px� 
Z
Releasing license: %s
83*common2"
Implementation2default:defaultZ17-83h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
532default:default2
132default:default2
232default:default2
02default:defaultZ4-41h px� 
^
%s completed successfully
29*	vivadotcl2 
route_design2default:defaultZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
route_design: 2default:default2
00:00:172default:default2
00:00:282default:default2
1181.3442default:default2
159.9492default:defaultZ17-268h px� 
D
Writing placer database...
1603*designutilsZ20-1893h px� 
=
Writing XDEF routing.
211*designutilsZ20-211h px� 
J
#Writing XDEF routing logical nets.
209*designutilsZ20-209h px� 
J
#Writing XDEF routing special nets.
210*designutilsZ20-210h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2)
Write XDEF Complete: 2default:default2
00:00:002default:default2 
00:00:00.1732default:default2
1181.3442default:default2
0.0002default:defaultZ17-268h px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2�
mD:/Facultate/Year1/Sem2/Digital System Design/project/Calculator/Calculator.runs/impl_1/Calculator_routed.dcp2default:defaultZ17-1381h px� 
P
Running DRC with %s threads
24*drc2
22default:defaultZ23-27h px� 
�
#The results of DRC are in file %s.
168*coretcl2�
qD:/Facultate/Year1/Sem2/Digital System Design/project/Calculator/Calculator.runs/impl_1/Calculator_drc_routed.rptqD:/Facultate/Year1/Sem2/Digital System Design/project/Calculator/Calculator.runs/impl_1/Calculator_drc_routed.rpt2default:default8Z2-168h px� 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px� 
Y
$Running Methodology with %s threads
74*drc2
22default:defaultZ23-133h px� 
�
2The results of Report Methodology are in file %s.
450*coretcl2�
}D:/Facultate/Year1/Sem2/Digital System Design/project/Calculator/Calculator.runs/impl_1/Calculator_methodology_drc_routed.rpt}D:/Facultate/Year1/Sem2/Digital System Design/project/Calculator/Calculator.runs/impl_1/Calculator_methodology_drc_routed.rpt2default:default8Z2-1520h px� 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px� 
r
UpdateTimingParams:%s.
91*timing29
% Speed grade: -1, Delay Type: min_max2default:defaultZ38-91h px� 
|
CMultithreading enabled for timing update using a maximum of %s CPUs155*timing2
22default:defaultZ38-191h px� 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px� 
�
Command: %s
53*	vivadotcl2�
vreport_power -file Calculator_power_routed.rpt -pb Calculator_power_summary_routed.pb -rpx Calculator_power_routed.rpx2default:defaultZ4-113h px� 
K
,Running Vector-less Activity Propagation...
51*powerZ33-51h px� 
P
3
Finished Running Vector-less Activity Propagation
1*powerZ33-1h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
632default:default2
132default:default2
232default:default2
02default:defaultZ4-41h px� 
^
%s completed successfully
29*	vivadotcl2 
report_power2default:defaultZ4-42h px� 


End Record