/*

	Updates player clothing by replacing vanilla by custom ones
        by Audacious

*/

private["_uniform","_backpack"];

///Uniform
////////////////

_uniform = uniform player;

switch(true) do
{
	case (playerSide == west && _uniform == "U_Rangemaster"):
	{
		if( (call life_coplevel) == 1) then
		{
			player setObjectTextureGlobal  [0,"images\kleidung\cop_1.jpg"];
		};
		
		if( (call life_coplevel) == 2) then
		{
			player setObjectTextureGlobal  [0,"images\kleidung\cop_2.jpg"];
		};
		
		if( (call life_coplevel) == 3) then
		{
			player setObjectTextureGlobal  [0,"images\kleidung\cop_3.jpg"];
		};
		
		if( (call life_coplevel) == 4) then
		{
			player setObjectTextureGlobal  [0,"images\kleidung\cop_4.jpg"];
		};
		
		if( (call life_coplevel) == 5) then
		{
			player setObjectTextureGlobal  [0,"images\kleidung\cop_5.jpg"];
		};
		
		if( (call life_coplevel) == 6) then
		{
			player setObjectTextureGlobal  [0,"images\kleidung\cop_6.jpg"];
		};
		
		if( (call life_coplevel) == 7) then
		{
			player setObjectTextureGlobal  [0,"images\kleidung\cop_7.jpg"];
		};
		
		if( (call life_coplevel) == 8) then
		{
			player setObjectTextureGlobal  [0,"images\kleidung\cop_8.jpg"];
		};

		if(backpack player != "") then {(unitBackpack player) setObjectTextureGlobal [0,""];};
	};
	
	case (playerSide == independent && _uniform == "U_Rangemaster"):
	{
		if( (call life_mediclevel) > 0) then
		{
			player setObjectTextureGlobal  [0, "images\kleidung\med_1.jpg"];
		};
		
		if(backpack player != "") then {(unitBackpack player) setObjectTextureGlobal [0,""];};
	};
	
	case (playerSide == east && _uniform == "U_C_WorkerCoveralls"):
	{
		if( (call life_adaclevel) > 0) then
		{
			player setObjectTextureGlobal  [0, "images\kleidung\adac_1.jpg"];
		};
		
		if(backpack player != "") then {(unitBackpack player) setObjectTextureGlobal [0,""];};
	};
	
	case (playerSide == civilian && _uniform == "U_I_HeliPilotCoveralls"):
	{
		player setObjectTextureGlobal  [0, "images\kleidung\jail.jpg"];
	};
};