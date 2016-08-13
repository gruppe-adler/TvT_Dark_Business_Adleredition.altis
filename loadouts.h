
class CfgFunctions {
    #include "node_modules\grad-loadout\cfgFunctions.hpp"
};
class CfgLoadouts {
    baseDelay = 0;
    perPlayerDelay = 1;

    class AllUnits {
        items[] = {
            "ACE_EarPlugs",
            "ACE_Flashlight_KSF1",
            LIST_5("ACE_fieldDressing")
        };
        linkedItems[] = {};
        magazines[] = {};
        weapons[] = {};
        primaryWeaponAttachments[] = {"acc_flashlight"};
        headgear = "";
        binoculars = "";
        backpack = "";
        gps = "";
        nvgoggles = "";
        goggles = "";
        map = "ItemMap";
        compass = "ItemCompass";
        watch = "ItemWatch";
    };

    class Blufor {
        uniform = "U_B_CombatUniform_mcam";
        primaryWeapon = "arifle_MX_F";
        primaryWeaponAttachments[] = {"acc_flashlight"};
        nvgoggles = "ACE_NVG_Gen1";
        headgear = "H_HelmetSpecB";
        vest = "V_PlateCarrierGL_mtp";
        gps = "ItemGPS";
    };
    class B_Pilot_F {
        uniform = "U_B_PilotCoveralls";
        primaryWeapon = "";
        primaryWeaponAttachments[] = {};
        headgear = "";
        map = "";
        gps = "";
        compass = "";
        watch = "";
        nvgoggles = "";
        vest = "";
    };
    class B_Helipilot_F {
        uniform = "U_B_HeliPilotCoveralls";
        primaryWeapon = "SMG_01_F";
        magazines[] = {
            LIST_3("30Rnd_45ACP_Mag_SMG_01_Tracer_Green"),
            "Chemlight_red"
        };
        headgear = "H_PilotHelmetHeli_B";
        vest = "";
    };
    class B_Officer_F {
        primaryWeapon = "arifle_MX_GL_F";
        binoculars = "ACE_Vector";
        magazines[] = {
            LIST_10("30Rnd_65x39_caseless_mag_Tracer"),
            LIST_2("SmokeShell"),
            LIST_5("Chemlight_red"),
            LIST_10("UGL_FlareRed_F")
        };
    };
    class B_Soldier_SL_F {
        primaryWeapon = "arifle_MX_GL_F";
        binoculars = "ACE_Vector";
        magazines[] = {
            LIST_10("30Rnd_65x39_caseless_mag_Tracer"),
            LIST_2("SmokeShell"),
            "HandGrenade",
            LIST_5("Chemlight_red"),
            LIST_10("UGL_FlareRed_F")
        };

    };
    class B_Soldier_TL_F {
        primaryWeapon = "arifle_MX_GL_F";
        gps = "ItemGPS";
        magazines[] = {
            LIST_10("30Rnd_65x39_caseless_mag_Tracer"),
            LIST_2("SmokeShell"),
            "HandGrenade",
            LIST_5("Chemlight_red"),
            LIST_10("UGL_FlareRed_F")
        };
    };
    class B_Soldier_F {
        primaryWeapon = "arifle_MX_F";
        magazines[] = {
            LIST_15("30Rnd_65x39_caseless_mag_Tracer"),
            LIST_4("SmokeShell"),
            LIST_4("HandGrenade"),
            LIST_2("Chemlight_red")
        };
    };
    class B_Soldier_AR_F {
        primaryWeapon = "arifle_MX_SW_F";
        magazines[] = {
            LIST_6("100Rnd_65x39_caseless_mag_Tracer"),
            "SmokeShell",
            LIST_2("Chemlight_red")
        };
    };

    class Opfor {
        uniform = "U_O_CombatUniform_ocamo";
        vest = "V_HarnessO_brn";
        headgear = "H_HelmetLeaderO_ocamo";
        primaryWeapon = "arifle_Katiba_GL_F";
        primaryWeaponAttachments[] = {"acc_flashlight"};
    };
    class O_Officer_F {
        uniform = "U_O_OfficerUniform_ocamo";
        gps = "ItemGPS";
        binoculars = "Binocular";
        magazines[] = {
            LIST_10("30Rnd_65x39_caseless_green_mag_Tracer"),
            LIST_2("SmokeShell"),
            LIST_5("Chemlight_green"),
            LIST_10("UGL_FlareGreen_F")
        };
    };
    class O_Soldier_SL_F {
        uniform = "U_O_OfficerUniform_ocamo";
        binoculars = "Binocular";
        gps = "ItemGPS";
        magazines[] = {
            LIST_10("30Rnd_65x39_caseless_green_mag_Tracer"),
            LIST_2("SmokeShell"),
            "HandGrenade",
            LIST_5("Chemlight_green"),
            LIST_10("UGL_FlareGreen_F")
        };
    };
    class O_Soldier_TL_F {
        uniform = "U_O_CombatUniform_ocamo";
        magazines[] = {
            LIST_10("30Rnd_65x39_caseless_green_mag_Tracer"),
            LIST_2("SmokeShell"),
            "HandGrenade",
            LIST_5("Chemlight_green"),
            LIST_10("UGL_FlareGreen_F")
        };
    };
    class O_Soldier_F {
        uniform = "U_O_CombatUniform_ocamo";
        primaryWeapon = "arifle_Katiba_F";
        primaryWeaponAttachments[] = {"acc_flashlight"};
        magazines[] = {
            LIST_10("30Rnd_65x39_caseless_green_mag_Tracer"),
            LIST_2("SmokeShell"),
            LIST_5("HandGrenade"),
            LIST_2("Chemlight_green")
        };
    };
    class O_Soldier_AR_F {
        uniform = "U_O_CombatUniform_ocamo";
        primaryWeapon = "LMG_Zafir_F";
        primaryWeaponAttachments[] = {"acc_flashlight"};
        magazines[] = {
            LIST_2("Chemlight_green"),
            LIST_2("SmokeShell"),
            LIST_4("150Rnd_762x54_Box_Tracer")
        };
    };

    class Independent {
        primaryWeapon = "arifle_TRG21_F";
        primaryWeaponAttachments[] = {"acc_flashlight"};
        vest = "V_Chestrig_oli";
        headgear = "H_HelmetIA";
    };
    class I_Officer_F {
        uniform = "U_I_OfficerUniform";
        binoculars = "Binocular";
        primaryWeapon = "arifle_TRG21_GL_F";
        primaryWeaponAttachments[] = {"acc_flashlight"};
        gps = "ItemGPS";
        magazines[] = {
            LIST_10("30Rnd_556x45_Stanag_Tracer_Red"),
            LIST_10("Chemlight_green"),
            LIST_2("SmokeShell"),
            LIST_12("UGL_FlareYellow_F")
        };

    };
    class I_Soldier_SL_F {
        uniform = "U_I_OfficerUniform";
        binoculars = "Binocular";
        primaryWeapon = "arifle_TRG21_GL_F";
        primaryWeaponAttachments[] = {"acc_flashlight"};
        gps = "ItemGPS";
        magazines[] = {
            LIST_10("30Rnd_556x45_Stanag_Tracer_Red"),
            LIST_5("Chemlight_green"),
            LIST_2("SmokeShell"),
            LIST_12("UGL_FlareYellow_F"),
            "HandGrenade"
        };
    };
    class I_Soldier_TL_F {
        uniform = "U_I_CombatUniform";
        primaryWeapon = "arifle_TRG21_GL_F";
        primaryWeaponAttachments[] = {"acc_flashlight"};
        magazines[] = {
            LIST_12("30Rnd_556x45_Stanag_Tracer_Red"),
            LIST_5("Chemlight_green"),
            LIST_2("SmokeShell"),
            LIST_10("UGL_FlareYellow_F"),
            LIST_2("HandGrenade")
        };
    };
    class I_Soldier_F {
        uniform = "U_I_CombatUniform";
        primaryWeapon = "arifle_TRG21_F";
        primaryWeaponAttachments[] = {"acc_flashlight"};
        magazines[] = {
            LIST_12("30Rnd_556x45_Stanag_Tracer_Red"),
            LIST_2("Chemlight_green"),
            LIST_4("SmokeShell"),
            LIST_4("HandGrenade")
        };
    };
    class I_Soldier_AR_F {
        uniform = "U_I_CombatUniform";
        primaryWeapon = "LMG_Mk200_F";
        primaryWeaponAttachments[] = {"acc_flashlight"};
        magazines[] = {
            LIST_2("Chemlight_green"),
            LIST_2("SmokeShell"),
            LIST_3("200Rnd_65x39_cased_Box_Tracer")
        };
    };
};
