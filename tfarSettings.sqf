// tfarSettings.sqf

TF_GIVE_MICRODAGR_TO_SOLDIER = false;
TF_SAME_LR_FREQUENCIES_FOR_SIDE = true;
TF_SAME_SW_FREQUENCIES_FOR_SIDE = true;
TF_TERRAIN_INTERCEPTION_COEFFICIENT = 6.0;

publicVariable "TF_GIVE_MICRODAGR_TO_SOLDIER";
publicVariable "TF_SAME_LR_FREQUENCIES_FOR_SIDE";
publicVariable "TF_SAME_SW_FREQUENCIES_FOR_SIDE";
publicVariable "TF_TERRAIN_INTERCEPTION_COEFFICIENT";

TF_defaultWestPersonalRadio = 'tf_anprc152';
TF_defaultGuerPersonalRadio = 'tf_anprc148jem';
TF_defaultEastPersonalRadio = 'tf_fadak';

publicVariable "TF_defaultWestPersonalRadio";
publicVariable "TF_defaultGuerPersonalRadio";
publicVariable "TF_defaultEastPersonalRadio";

TF_defaultWestRiflemanRadio = TF_defaultWestPersonalRadio;
TF_defaultGuerRiflemanRadio = TF_defaultGuerPersonalRadio;
TF_defaultEastRiflemanRadio = TF_defaultEastPersonalRadio;

publicVariable "TF_defaultWestRiflemanRadio";
publicVariable "TF_defaultGuerRiflemanRadio";
publicVariable "TF_defaultEastRiflemanRadio";
