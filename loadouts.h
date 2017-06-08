class CfgFunctions {
    #include "node_modules\grad-loadout\cfgFunctions.hpp"
};
class Loadouts {
    baseDelay = 0;
    perPlayerDelay = 1;
    handleRadios = 1;
    resetLoadout = 1;

    class AllUnits {
        addItemsToUniform[] = {
            "ACE_EarPlugs",
            "ACE_Flashlight_KSF1",
            LIST_5("ACE_fieldDressing")
        };
        primaryWeaponPointer = "acc_flashlight";
        map = "ItemMap";
        compass = "ItemCompass";
        watch = "ItemWatch";
    };

    class Side {
        class Blufor {
            uniform = "rhs_uniform_g3_blk";
            primaryWeapon = "arifle_MX_F";
            primaryWeaponOptics = "optic_aco";
            nvgoggles = "ACE_NVG_Gen1";
            headgear = "rhsusf_protech_helmet_rhino_ess";
            vest = "V_TacVest_oli";
            gps = "ItemGPS";
            radio = "tf_anprc152";
        };
        class Opfor {
            uniform = "rhs_uniform_gorka_r_g";
            vest = "rhs_6b13_EMR";
            headgear = "rhs_6b27m_green_ess_bala";
            primaryWeapon = "arifle_AK12_F";
            primaryWeaponOptics = "optic_aco_grn";
            primaryWeaponPointer = "rhs_acc_2dpZenit";
            radio = "tf_fadak";
        };
        class Independent {
            uniform = "rhsgref_uniform_woodland";
            primaryWeapon = "arifle_AK12_F";
            primaryWeaponOptics = "optic_aco";
            primaryWeaponPointer = "rhs_acc_2dpZenit";
            vest = "V_Chestrig_oli";
            headgear = "rhsgref_helmet_pasgt_woodland";
            radio = "tf_anprc148jem";
        };
    };


    class Type {
        class B_Pilot_F {
            uniform = "U_B_PilotCoveralls";
            vest = "";
            backpack = "";
            primaryWeapon = "";
            primaryWeaponAttachments[] = {};
            headgear = "";
            map = "";
            gps = "";
            compass = "";
            watch = "";
            nvgoggles = "";
            radio = "";
        };
        class B_Helipilot_F {
            uniform = "U_B_PilotCoveralls";
            primaryWeapon = "rhs_weap_m16a4_carryhandle";
            addItemsToVest[] = {
                LIST_3("rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red"),
                "Chemlight_red"
            };
            headgear = "H_PilotHelmetHeli_B";
            vest = "";
        };
        class B_Officer_F {
            backpack = "tf_rt1523g";
            primaryWeapon = "rhs_weap_m16a4_carryhandle_M203";
            binoculars = "ACE_Vector";
            addItemsToVest[] = {
                LIST_10("rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red"),
                LIST_2("SmokeShell"),
                LIST_5("Chemlight_red"),
                LIST_10("UGL_FlareRed_F")
            };
        };
        class B_Soldier_SL_F {
            backpack = "tf_rt1523g";
            primaryWeapon = "rhs_weap_m16a4_carryhandle_M203";
            binoculars = "ACE_Vector";
            addItemsToVest[] = {
                LIST_10("rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red"),
                LIST_2("SmokeShell"),
                "HandGrenade",
                LIST_5("Chemlight_red"),
                LIST_10("UGL_FlareRed_F")
            };

        };
        class B_Soldier_TL_F {
            primaryWeapon = "rhs_weap_m16a4_carryhandle";
            gps = "ItemGPS";
            addItemsToVest[] = {
                LIST_10("rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red"),
                LIST_2("SmokeShell"),
                "HandGrenade",
                LIST_5("Chemlight_red"),
                LIST_10("UGL_FlareRed_F")
            };
        };
        class B_Soldier_F {
            primaryWeapon = "rhs_weap_m16a4_carryhandle";
            addItemsToVest[] = {
                LIST_15("rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red"),
                LIST_4("SmokeShell"),
                LIST_4("HandGrenade"),
                LIST_2("Chemlight_red")
            };
        };
        class B_Soldier_AR_F {
            primaryWeapon = "rhs_weap_m249_pip_L_para";
            addItemsToVest[] = {
                LIST_6("rhs_200rnd_556x45_T_SAW"),
                "SmokeShell",
                LIST_2("Chemlight_red")
            };
        };

        class O_Officer_F {
            backpack = "tf_mr3000";
            gps = "ItemGPS";
            binoculars = "Binocular";
            primaryWeapon = "arifle_AK12_GL_F";
            headgear = "rhs_beret_milp";
            addItemsToVest[] = {
                LIST_10("30Rnd_762x39_Mag_Tracer_Green_F"),
                LIST_2("SmokeShell"),
                LIST_5("Chemlight_green"),
                LIST_10("UGL_FlareGreen_F")
            };
        };
        class O_Soldier_SL_F {
            backpack = "tf_mr3000";
            binoculars = "Binocular";
            primaryWeapon = "arifle_AK12_GL_F";
            headgear = "H_Bandanna_khk_hs";
            gps = "ItemGPS";
            addItemsToVest[] = {
                LIST_10("30Rnd_762x39_Mag_Tracer_Green_F"),
                LIST_2("SmokeShell"),
                "HandGrenade",
                LIST_5("Chemlight_green"),
                LIST_10("UGL_FlareGreen_F")
            };
        };
        class O_Soldier_TL_F {
            primaryWeapon = "arifle_AK12_GL_F";
            addItemsToVest[] = {
                LIST_10("30Rnd_762x39_Mag_Tracer_Green_F"),
                LIST_2("SmokeShell"),
                "HandGrenade",
                LIST_5("Chemlight_green"),
                LIST_10("UGL_FlareGreen_F")
            };
        };
        class O_Soldier_F {
            addItemsToVest[] = {
                LIST_10("30Rnd_762x39_Mag_Tracer_Green_F"),
                LIST_2("SmokeShell"),
                LIST_5("HandGrenade"),
                LIST_2("Chemlight_green")
            };
        };
        class O_Soldier_AR_F {
            primaryWeapon = "rhs_weap_pkm";
            addItemsToVest[] = {
                LIST_2("Chemlight_green"),
                LIST_2("SmokeShell"),
                LIST_4("rhs_100Rnd_762x54mmR_green")
            };
        };


        class I_Officer_F {
            uniform = "rhsgref_uniform_woodland";
            backpack = "tf_anprc155";
            binoculars = "Binocular";
            primaryWeapon = "arifle_AK12_GL_F";
            headgear = "rhs_beret_mp1";
            gps = "ItemGPS";
            addItemsToVest[] = {
                LIST_10("30Rnd_762x39_Mag_Tracer_F"),
                LIST_10("Chemlight_yellow"),
                LIST_2("SmokeShell"),
                LIST_12("UGL_FlareYellow_F")
            };

        };
        class I_Soldier_SL_F {
            uniform = "rhsgref_uniform_woodland";
            backpack = "tf_anprc155";
            binoculars = "Binocular";
            primaryWeapon = "arifle_AK12_GL_F";
            headgear = "H_MilCap_tna_F";
            gps = "ItemGPS";
            addItemsToVest[] = {
                LIST_10("30Rnd_762x39_Mag_Tracer_F"),
                LIST_5("Chemlight_yellow"),
                LIST_2("SmokeShell"),
                LIST_12("UGL_FlareYellow_F"),
                "HandGrenade"
            };
        };
        class I_Soldier_TL_F {
            uniform = "rhsgref_uniform_woodland";
            primaryWeapon = "arifle_AK12_GL_F";
            addItemsToVest[] = {
                LIST_12("30Rnd_762x39_Mag_Tracer_F"),
                LIST_5("Chemlight_yellow"),
                LIST_2("SmokeShell"),
                LIST_10("UGL_FlareYellow_F"),
                LIST_2("HandGrenade")
            };
        };
        class I_Soldier_F {
            uniform = "rhsgref_uniform_woodland";
            primaryWeapon = "arifle_AK12_F";
            addItemsToVest[] = {
                LIST_12("30Rnd_762x39_Mag_Tracer_F"),
                LIST_2("Chemlight_yellow"),
                LIST_4("SmokeShell"),
                LIST_4("HandGrenade")
            };
        };
        class I_Soldier_AR_F {
            uniform = "rhsgref_uniform_woodland";
            primaryWeapon = "LMG_Mk200_F";
            primaryWeaponAttachments = "bipod_03_F_blk";
            addItemsToVest[] = {
                LIST_2("Chemlight_yellow"),
                LIST_2("SmokeShell"),
                LIST_3("200Rnd_65x39_cased_Box_Tracer")
            };
        };
    };
};
