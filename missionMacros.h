#define debugLog(msg) if (DEBUG_MODE) then { [msg, "ga_dark_business_debug", [true, true, true] ] call CBA_fnc_debug; }
#define adminLog(msg) [msg, "ga_dark_business_admin", [false, true, false] ] call CBA_fnc_debug; 
