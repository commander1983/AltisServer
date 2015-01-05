/*
Cell Phone Battery script by KampfKuerbisHD // http://www.youtube.com/kampfkuerbishd
*/

if(life_battery < 2) exitWith {hint "Dein Akku ist leer!"};

if("ItemRadio" in assignedItems player) then {
	createDialog "Life_my_smartphone";
}else{
	hint parseText format ["<t size='1.30' font='puristaMedium' align='center' color='#0D82DF'>Du hast kein Handy mehr!</t><br/><br/>
	<t size='0.90 'font='puristaLight' align='left'>Du kannst es dir im Werkzeugladen kaufen!</t><br/>"];
};