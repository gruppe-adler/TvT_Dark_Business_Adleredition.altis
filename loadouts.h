#define SANI_BACKPACK() \
    LIST_25("ACE_fieldDressing"),LIST_25("ACE_elasticBandage"),LIST_10("ACE_packingBandage"),LIST_10("ACE_quikclot"),LIST_12("ACE_epinephrine"),LIST_16("ACE_morphine"),LIST_6("ACE_adenosine"),LIST_6("ACE_tourniquet"),LIST_8("ACE_salineIV_500")

class Loadouts {
    baseDelay = 5;
    perPlayerDelay = 1;
    handleRadios = 1;
    resetLoadout = 1;

    class AllUnits {
        addItemsToUniform[] = {
            "ACE_Flashlight_KSF1",

            LIST_4("ACE_packingBandage"),
            LIST_4("ACE_elasticBandage"),
            LIST_4("ACE_quikclot"),
            LIST_4("ACE_tourniquet"),
            LIST_2("ACE_morphine"),
            LIST_2("ACE_epinephrine")
        };
        map = "ItemMap";
        compass = "ItemCompass";
        watch = "ItemWatch";
    };
    /*
        rough concept:
        * SQL, TL should get signalling capabilities
        * Riflemen get Grenades
        * ARs get their SAWs
        * AARs get additional ammo for AR, ofc
        * Medics get more smoke

        BTW -- hi chemlights seem to be visible for ~500m
    */

    class Side {
        class Blufor {
            uniform = "rhs_uniform_g3_blk";
            primaryWeapon = "rhs_weap_m16a4_carryhandle";
            primaryWeaponOptics = "optic_aco";
            primaryWeaponPointer = "rhsusf_acc_anpeq15a";
            nvgoggles = "ACE_NVG_Gen1";
            headgear = "rhsusf_protech_helmet_rhino_ess";
            vest = "V_TacVest_oli";
            addItemsToVest[] = {"acc_flashlight"};
            gps = "ItemGPS";
            radio = "tf_anprc152";
        };
        class Opfor {
            uniform = "rhs_uniform_gorka_r_g";
            vest = "rhs_vydra_3m";
            backpack = "rhs_assault_umbts";
            headgear = "rhs_6b27m_green_ess_bala";
            primaryWeapon = "arifle_AK12_F";
            primaryWeaponOptics = "optic_aco_grn";
            primaryWeaponPointer = "acc_flashlight";
            radio = "tf_fadak";
        };
        class Independent {
            uniform = "rhsgref_uniform_woodland";
            vest = "V_TacChestrig_cbr_F";
            backpack = "B_Kitbag_mcamo";
            primaryWeapon = "arifle_AK12_F";
            primaryWeaponOptics = "optic_aco";
            primaryWeaponPointer = "acc_flashlight";
            headgear = "rhsgref_helmet_pasgt_woodland";
            radio = "tf_anprc148jem";
        };
    };

    class Type {

        class B_Pilot_F {
            uniform = "U_B_PilotCoveralls";
            addItemsToUniform[] = {"acc_flashlight", "ACE_IR_Strobe_Item", "ACE_Chemlight_IR", "ACE_Chemlight_HiRed"};
            vest = "";
            backpack = "";
            primaryWeapon = "";
            primaryWeaponPointer = "";
            primaryWeaponOptics = "";
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
                "ACE_Chemlight_Hired"
            };
            headgear = "H_PilotHelmetHeli_B";
        };
        class B_Officer_F {
            backpack = "tf_rt1523g_black";
            headgear = "H_Beret_02";
            primaryWeapon = "rhs_weap_m16a4_carryhandle_M203";
            binoculars = "ACE_Vector";
            addItemsToVest[] = {
                LIST_10("rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red"),
                LIST_2("SmokeShell")
            };
            addItemsToBackpack[] = {
                LIST_4("ACE_Chemlight_Hired"),
                LIST_10("UGL_FlareRed_F")
            };
        };
        class B_Soldier_SL_F {
            backpack = "tf_rt1523g_black";
            headgear = "H_Booniehat_khk_hs";
            primaryWeapon = "rhs_weap_m16a4_carryhandle_M203";
            binoculars = "ACE_Vector";
            addItemsToVest[] = {
                LIST_10("rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red"),
                LIST_2("SmokeShell")
            };
            addItemsToBackpack[] = {
                LIST_4("ACE_Chemlight_Hired"),
                LIST_8("UGL_FlareRed_F")
            };
        };
        class B_Soldier_TL_F {
            primaryWeapon = "rhs_weap_m16a4_carryhandle";
            addItemsToVest[] = {
                LIST_10("rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red"),
                LIST_2("SmokeShell")
            };
            addItemsToBackpack[] = {
                LIST_4("ACE_Chemlight_Hired"),
                LIST_4("UGL_FlareRed_F")
            };
        };
        class B_Soldier_AR_F {
            primaryWeapon = "rhs_weap_m249_pip_L_para";
            addItemsToVest[] = {
                LIST_3("rhs_200rnd_556x45_T_SAW"),
                "SmokeShell"
            };
            addItemsToBackpack[] = {
                LIST_2("ACE_Chemlight_Hired")
            };
        };
        class B_Soldier_AAR_F {
            primaryWeapon = "rhs_weap_m16a4_carryhandle";
            addItemsToVest[] = {
                LIST_8("rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red"),
                "SmokeShell"
            };
            addItemsToBackpack[] = {
                LIST_4("rhs_200rnd_556x45_T_SAW"),
                LIST_2("ACE_Chemlight_Hired")
            };
        };
        class B_Medic_F {
            primaryWeapon = "rhs_weap_m16a4_carryhandle";
            addItemsToVest[] = {
                LIST_8("rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red"),
                LIST_2("ACE_Chemlight_HiRed"),
                LIST_2("ACE_Chemlight_HiBlue"),
                LIST_4("SmokeShell")
            };
            addItemsToBackpack[] = {
                SANI_BACKPACK()
            };
        };
        class B_Soldier_F {
            primaryWeapon = "rhs_weap_m16a4_carryhandle";
            addItemsToVest[] = {
                LIST_10("rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red"),
                LIST_2("SmokeShell")
            };
            addItemsToBackpack[] = {
                LIST_5("rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red"),
                LIST_4("HandGrenade"),
                LIST_2("ACE_Chemlight_Hired")
            };
        };
        class B_Soldier_AT_F: B_Soldier_F {};

        class O_Officer_F {
            backpack = "tf_mr3000_rhs";
            gps = "ItemGPS";
            binoculars = "Binocular";
            primaryWeapon = "arifle_AK12_GL_F";
            headgear = "rhs_beret_milp";
            addItemsToVest[] = {
                LIST_10("30Rnd_762x39_Mag_Tracer_Green_F"),
                LIST_2("SmokeShell")
            };
            addItemsToBackpack[] = {
                LIST_4("ACE_Chemlight_Higreen"),
                LIST_10("UGL_FlareGreen_F")
            };
        };
        class O_Soldier_SL_F {
            backpack = "tf_mr3000_rhs";
            binoculars = "Binocular";
            primaryWeapon = "arifle_AK12_GL_F";
            headgear = "H_Bandanna_khk_hs";
            gps = "ItemGPS";
            addItemsToVest[] = {
                LIST_10("30Rnd_762x39_Mag_Tracer_Green_F"),
                LIST_2("SmokeShell")
            };
            addItemsToBackpack[] = {
                LIST_4("ACE_Chemlight_Higreen"),
                LIST_8("UGL_FlareGreen_F")
            };
        };
        class O_Soldier_TL_F {
            primaryWeapon = "arifle_AK12_GL_F";
            addItemsToVest[] = {
                LIST_10("30Rnd_762x39_Mag_Tracer_Green_F"),
                LIST_2("SmokeShell")
            };
            addItemsToBackpack[] = {
                LIST_4("ACE_Chemlight_Higreen"),
                LIST_4("UGL_FlareGreen_F")
            };
        };
        class O_Soldier_AR_F {
            primaryWeapon = "rhs_weap_pkm";
            addItemsToVest[] = {
                LIST_2("ACE_Chemlight_Higreen"),
                LIST_2("SmokeShell")
            };
            addItemsToBackpack[] = {
                LIST_6("rhs_100Rnd_762x54mmR_green")
            };
        };
        class O_Soldier_AAR_F {
            primaryWeapon = "arifle_AK12_F";
            headgear = "rhs_6b27m_green";
            addItemsToVest[] = {
                LIST_8("30Rnd_762x39_Mag_Tracer_F"),
                LIST_2("ACE_Chemlight_Higreen"),
                LIST_2("SmokeShell")
            };
            addItemsToBackpack[] = {
                LIST_6("rhs_100Rnd_762x54mmR_green")
            };
        };
        class O_Medic_F {
            primaryWeapon = "arifle_AK12_F";
            headgear = "rhs_6b27m_green";
            addItemsToVest[] = {
                LIST_8("30Rnd_762x39_Mag_Tracer_F"),
                LIST_2("ACE_Chemlight_HiGreen"),
                LIST_2("ACE_Chemlight_HiBlue"),
                LIST_4("SmokeShell")
            };
            addItemsToBackpack[] = {
                SANI_BACKPACK()
            };
        };
        class O_Soldier_F {
            primaryWeapon = "arifle_AK12_F";
            headgear = "rhs_6b27m_green_ess";
            addItemsToVest[] = {
                LIST_10("30Rnd_762x39_Mag_Tracer_Green_F"),
                LIST_2("SmokeShell")
            };
            addItemsToBackpack[] = {
                LIST_5("30Rnd_762x39_Mag_Tracer_Green_F"),
                LIST_4("HandGrenade"),
                LIST_2("ACE_Chemlight_Higreen")
            };
        };
        class O_Soldier_AT_F: O_Soldier_F {};

        class I_Officer_F {
            backpack = "tf_anprc155";
            binoculars = "Binocular";
            primaryWeapon = "arifle_AK12_GL_F";
            headgear = "rhs_beret_mp1";
            gps = "ItemGPS";
            addItemsToVest[] = {
                LIST_10("30Rnd_762x39_Mag_Tracer_F"),
                LIST_2("SmokeShell")
            };
            addItemsToBackpack[] = {
                LIST_4("ACE_Chemlight_HiYellow"),
                LIST_10("UGL_FlareYellow_F")
            };

        };
        class I_Soldier_SL_F {
            backpack = "tf_anprc155";
            binoculars = "Binocular";
            primaryWeapon = "arifle_AK12_GL_F";
            headgear = "H_MilCap_tna_F";
            gps = "ItemGPS";
            addItemsToVest[] = {
                LIST_10("30Rnd_762x39_Mag_Tracer_F"),
                LIST_2("SmokeShell")
            };
            addItemsToBackpack[] = {
                LIST_4("ACE_Chemlight_Hiyellow"),
                LIST_8("UGL_FlareYellow_F")
            };
        };
        class I_Soldier_TL_F {
            primaryWeapon = "arifle_AK12_GL_F";
            addItemsToVest[] = {
                LIST_10("30Rnd_762x39_Mag_Tracer_F"),
                LIST_2("SmokeShell")
            };
            addItemsToBackpack[] = {
                LIST_4("ACE_Chemlight_Hiyellow"),
                LIST_4("UGL_FlareYellow_F")
            };
        };
        class I_Soldier_AR_F {
            primaryWeapon = "LMG_Mk200_F";
            primaryWeaponUnderbarrel = "bipod_03_F_blk";
            addItemsToVest[] = {
                LIST_2("ACE_Chemlight_Hiyellow"),
                LIST_2("SmokeShell")
            };
            addItemsToBackpack[] = {
                LIST_3("200Rnd_65x39_cased_Box_Tracer")
            };
        };
        class I_Soldier_AAR_F {
            primaryWeapon = "arifle_AK12_F";
            addItemsToVest[] = {
                LIST_8("30Rnd_762x39_Mag_Tracer_F"),
                LIST_2("SmokeShell")
            };
            addItemsToBackpack[] = {
                LIST_2("ACE_Chemlight_HiYellow"),
                LIST_3("200Rnd_65x39_cased_Box_Tracer")
            };
        };
        class I_Medic_F {
            primaryWeapon = "arifle_AK12_F";
            addItemsToVest[] = {
                LIST_12("30Rnd_762x39_Mag_Tracer_F"),
                LIST_2("ACE_Chemlight_Hiyellow"),
                LIST_2("ACE_Chemlight_HiBlue"),
                LIST_4("SmokeShell")
            };
            addItemsToBackpack[] = {
                SANI_BACKPACK()
            };
        };
        class I_Soldier_F {
            primaryWeapon = "arifle_AK12_F";
            addItemsToVest[] = {
                LIST_10("30Rnd_762x39_Mag_Tracer_F"),
                LIST_2("SmokeShell")
            };
            addItemsToBackpack[] = {
                LIST_5("30Rnd_762x39_Mag_Tracer_F"),
                LIST_2("ACE_Chemlight_Hiyellow"),
                LIST_4("HandGrenade")
            };
        };
        class I_Soldier_AT_F: I_Soldier_F {};
    };
};
