if(ja_pare < 1500) exitWith {hint format[localize "STR_NOTF_HS_NoCash",1500];};
titleText[localize "STR_NOTF_HS_Healing","PLAIN"];
sleep 8;
if(player distance (_this select 0) > 5) exitWith {titleText[localize "STR_NOTF_HS_ToFar","PLAIN"]};
titleText[localize "STR_NOTF_HS_Healed","PLAIN"];
player setdamage 0;
ja_pare = ja_pare - 1500;