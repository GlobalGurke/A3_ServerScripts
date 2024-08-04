//_action = ["openArsenal","Arsenal","",{systemChat "TRIGGERED";},{true}] call ace_interact_menu_fnc_createAction;
//[gear, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;
params ["_role"];
_riflemans = ['[[["ADFU_SteyrEF88","","","rhsusf_acc_ACOG",["rhs_mag_30Rnd_556x45_M196_Stanag_Tracer_Red",30],[],""],[],["rhsusf_weap_glock17g4","","","",["rhsusf_mag_17Rnd_9x19_FMJ",17],[],""],["Rho_AMCU_Combat_Rolled",[["ACE_elasticBandage",15],["ACE_quikclot",10],["ACE_epinephrine",1],["ACE_morphine",1],["ACE_splint",2],["ACE_tourniquet",4],["ACE_EarPlugs",1],["ACE_IR_Strobe_Item",1],["ACE_CableTie",2],["ACRE_PRC152",1],["kat_Painkiller",1,10],["SmokeShell",1,1]]],["rho_rar_vest_rifle",[["rhsusf_mag_17Rnd_9x19_FMJ",2,17],["SmokeShell",1,1],["rhs_mag_m67",2,1],["kat_Caffeine",1,15],["rhs_mag_30Rnd_556x45_M196_Stanag_Tracer_Red",10,30]]],["ADFU_Assaultpack_AMC",[["ACE_EntrenchingTool",1]]],"rho_rar_tw_exfil_comtac_ir_bat","rhsusf_shemagh_gogg_tan",["Binocular","","","",[],[],""],["ItemMap","ItemAndroid","","ItemCompass","ItemWatch","rhsusf_ANPVS_15"]],[]]'];
_antitanks = [antitank1, antitank2, antitank3];
_mgs = [mg1, mg2, mg3, mg4];
_medics = [medic1, medic2];
_grenadiers = [grenadier1, grenadier2];
_dmr = [dmr1, dmr2, dmr3];
_squadleaders = [squadlead1, squadlead2];
Loadout = [];
if (_role == "Munitionsträger/ Schütze @Alpha 1") then {
{
	Loadout = Loadout + [(headgear _x)] + [(goggles _x)] + (assignedItems _x) + (backpackitems _x)+ [(backpack _x)] + (uniformItems _x) + [(uniform _x)] + (vestItems _x) + [(vest _x)] + (magazines _x) + (weapons _x) + (primaryWeaponItems _x)+ (primaryWeaponMagazine _x) + (handgunMagazine _x) + (handgunItems _x) + (secondaryWeaponItems _x) + (secondaryWeaponMagazine _x);
} forEach _riflemans;
};

if (_role == "Automatic Rifleman @Alpha 1") then {
{
	Loadout = Loadout + [(headgear _x)] + [(goggles _x)] + (assignedItems _x) + (backpackitems _x)+ [(backpack _x)] + (uniformItems _x) + [(uniform _x)] + (vestItems _x) + [(vest _x)] + (magazines _x) + (weapons _x) + (primaryWeaponItems _x)+ (primaryWeaponMagazine _x) + (handgunMagazine _x) + (handgunItems _x) + (secondaryWeaponItems _x) + (secondaryWeaponMagazine _x);
} forEach _mgs;
};

if (_role == "Antitank") then {
{
	Loadout = Loadout + [(headgear _x)] + [(goggles _x)] + (assignedItems _x) + (backpackitems _x)+ [(backpack _x)] + (uniformItems _x) + [(uniform _x)] + (vestItems _x) + [(vest _x)] + (magazines _x) + (weapons _x) + (primaryWeaponItems _x)+ (primaryWeaponMagazine _x) + (handgunMagazine _x) + (handgunItems _x) + (secondaryWeaponItems _x) + (secondaryWeaponMagazine _x);
} forEach _antitanks;
};

if (_role == "Medic") then {
{
	Loadout = Loadout + [(headgear _x)] + [(goggles _x)] + (assignedItems _x) + (backpackitems _x)+ [(backpack _x)] + (uniformItems _x) + [(uniform _x)] + (vestItems _x) + [(vest _x)] + (magazines _x) + (weapons _x) + (primaryWeaponItems _x)+ (primaryWeaponMagazine _x) + (handgunMagazine _x) + (handgunItems _x) + (secondaryWeaponItems _x) + (secondaryWeaponMagazine _x);
} forEach _medics;
};

if (_role == "Grenadier") then {
{
	Loadout = Loadout + [(headgear _x)] + [(goggles _x)] + (assignedItems _x) + (backpackitems _x)+ [(backpack _x)] + (uniformItems _x) + [(uniform _x)] + (vestItems _x) + [(vest _x)] + (magazines _x) + (weapons _x) + (primaryWeaponItems _x)+ (primaryWeaponMagazine _x) + (handgunMagazine _x) + (handgunItems _x) + (secondaryWeaponItems _x) + (secondaryWeaponMagazine _x);
} forEach _grenadiers;
};

if (_role == "DMR") then {
{
	Loadout = Loadout + [(headgear _x)] + [(goggles _x)] + (assignedItems _x) + (backpackitems _x)+ [(backpack _x)] + (uniformItems _x) + [(uniform _x)] + (vestItems _x) + [(vest _x)] + (magazines _x) + (weapons _x) + (primaryWeaponItems _x)+ (primaryWeaponMagazine _x) + (handgunMagazine _x) + (handgunItems _x) + (secondaryWeaponItems _x) + (secondaryWeaponMagazine _x);
} forEach _dmr;
};

if (_role == "Squadlead") then {
{
	Loadout = Loadout + [(headgear _x)] + [(goggles _x)] + (assignedItems _x) + (backpackitems _x)+ [(backpack _x)] + (uniformItems _x) + [(uniform _x)] + (vestItems _x) + [(vest _x)] + (magazines _x) + (weapons _x) + (primaryWeaponItems _x)+ (primaryWeaponMagazine _x) + (handgunMagazine _x) + (handgunItems _x) + (secondaryWeaponItems _x) + (secondaryWeaponMagazine _x);
} forEach _squadleaders;
};

Loadout = Loadout select {count _x > 0};
Loadout = Loadout arrayIntersect Loadout;
[gear, Loadout] call ace_arsenal_fnc_initBox;
systemChat format["Ausgewählte Rolle: %1", _role];