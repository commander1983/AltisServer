/*
	File: fn_fadeSound.sqf
	Auhtor: Michael Francis
	
	Description:
	Fades out sound.
*/
life_fadeSound = !life_fadeSound;

if (life_fadeSound) then 
{
	1 fadeSound 0.01; // Faded to 10%
	titleText ["Ear Plugs in...", "PLAIN"];
}
else
{
	1 fadeSound 1; // Returned to 100%
	titleText ["Ear Plugs out...", "PLAIN"];
};