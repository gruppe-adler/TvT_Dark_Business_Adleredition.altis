#define debugLog(msg) if (DEBUG_MODE) then { [msg, "GRAD_mission_debug", [true, true, true] ] call CBA_fnc_debug; }
#define adminLog(msg) [msg, "GRAD_mission_admin", [DEBUG_MODE, true, false] ] call CBA_fnc_debug

// brazenly stolen from 1tac
#define LIST_2(var1) var1,var1
#define LIST_3(var1) var1,var1,var1
#define LIST_4(var1) var1,var1,var1,var1
#define LIST_5(var1) var1,var1,var1,var1,var1
#define LIST_6(var1) var1,var1,var1,var1,var1,var1
#define LIST_7(var1) var1,var1,var1,var1,var1,var1,var1
#define LIST_8(var1) var1,var1,var1,var1,var1,var1,var1,var1
#define LIST_9(var1) var1,var1,var1,var1,var1,var1,var1,var1,var1
#define LIST_10(var1) var1,var1,var1,var1,var1,var1,var1,var1,var1,var1
#define LIST_11(var1) LIST_10(var1),var1
#define LIST_12(var1) LIST_10(var1),LIST_2(var1)
#define LIST_13(var1) LIST_10(var1),LIST_3(var1)
#define LIST_14(var1) LIST_10(var1),LIST_4(var1)
#define LIST_15(var1) LIST_10(var1),LIST_5(var1)
#define LIST_16(var1) LIST_10(var1),LIST_6(var1)
#define LIST_17(var1) LIST_10(var1),LIST_7(var1)
#define LIST_18(var1) LIST_10(var1),LIST_8(var1)
#define LIST_19(var1) LIST_10(var1),LIST_9(var1)
#define LIST_20(var1) LIST_10(var1),LIST_10(var1),
#define LIST_21(var1) LIST_10(var1),LIST_10(var1),var1
#define LIST_22(var1) LIST_10(var1),LIST_10(var1),LIST_2(var1)
#define LIST_23(var1) LIST_10(var1),LIST_10(var1),LIST_3(var1)
#define LIST_24(var1) LIST_10(var1),LIST_10(var1),LIST_4(var1)
#define LIST_25(var1) LIST_10(var1),LIST_10(var1),LIST_5(var1)
