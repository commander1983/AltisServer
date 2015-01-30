/*
	File: fn_fadeSound.sqf
	Auhtor: Michael Francis
	
	Description:
	Fades out sound.
*/
life_fadeSound = !life_fadeSound;

if (life_fadeSound) then 
{
	1 fadeSound 0.05; // Faded to 10%
	titleText ["Ohrstoepsel wurden ins Ohr gesteckt.", "PLAIN"];
}
else
{
	1 fadeSound 1; // Returned to 100%
	titleText ["Ohrstoepsel wurden aus dem Ohr gezogen.", "PLAIN"];
};