// tfarSettings.sqf

compile preprocessFileLineNumbers "\task_force_radio\functions\common.sqf";

TF_GIVE_MICRODAGR_TO_SOLDIER = false;
//TF_GIVE_PERSONAL_RADIO_TO_REGULAR_SOLDIER = false; //"personal"= LR radio
//TF_NO_AUTO_LONG_RANGE_RADIO = false; // squad leads + up
TF_RADIO_CHANNEL_NAME = "TFAR";
TF_RADIO_CHANNEL_PASSWORD = "helium";
TF_SAME_LR_FREQUENCIES_FOR_SIDE = true;
TF_SAME_SW_FREQUENCIES_FOR_SIDE = true;
TF_TERRAIN_INTERCEPTION_COEFFICIENT = 6.0;

publicVariable "TF_GIVE_MICRODAGR_TO_SOLDIER";
//publicVariable "TF_GIVE_PERSONAL_RADIO_TO_REGULAR_SOLDIER";
//publicVariable "TF_NO_AUTO_LONG_RANGE_RADIO";
publicVariable "TF_RADIO_CHANNEL_NAME";
publicVariable "TF_RADIO_CHANNEL_PASSWORD";
publicVariable "TF_SAME_LR_FREQUENCIES_FOR_SIDE";
publicVariable "TF_SAME_SW_FREQUENCIES_FOR_SIDE";
publicVariable "TF_TERRAIN_INTERCEPTION_COEFFICIENT";
