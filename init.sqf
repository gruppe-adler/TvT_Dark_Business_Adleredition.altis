TF_NO_AUTO_LONG_RANGE_RADIO = true;

DEBUG_MODE = (paramsArray select 0) == 1;
VIRTUAL_ARSENAL_PLACEMENTS = (paramsArray select 1);
ALLOW_40MM_HE = (paramsArray select 2) == 1;


[] execVM "CSSA3\CSSA3_init.sqf";

execVM "spreadLove.sqf"; // so the hostage can board all vehicles. also, nice for testing.

if (!isDedicated) then {
	waitUntil {!isNull player};

	execVM "prepPlayer.sqf";
	execVM "addBriefing.sqf";
	execVM "keepLove.sqf";
	execVM "addArsenal.sqf";
};


//if (!ALLOW_40MM_HE) then {
//	blufor_munitions removeMagazines "1Rnd_HE_Grenade_shell";
//	opfor_munitions removeMagazines "1Rnd_HE_Grenade_shell";
//	ind_munitions removeMagazines "1Rnd_HE_Grenade_shell";
//};
