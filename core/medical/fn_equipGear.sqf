if (playerSide == independent) then {
	if ((uniform player) == "U_Rangemaster") then
	{
		[[player,"images\kleidung\med_1.jpg"], "life_fnc_setUniform", true, true] spawn BIS_fnc_MP;
	};
};

if (playerSide == east) then {
	if ((uniform player) == "U_C_WorkerCoveralls") then
	{
		[[player,"images\kleidung\adac_1.jpg"], "life_fnc_setUniform", true, true] spawn BIS_fnc_MP;
	};
};