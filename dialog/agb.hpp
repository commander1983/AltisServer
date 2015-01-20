class AGB
{
	idd = 32154;
	name = "AGB";
	movingEnable = false;
	enableSimulation = false;
    
	class controlsBackground
	{
		class RscTitleBackground : Life_RscText
		{
			colorBackground[] = {0.09,0.55,0,1};
			idc = -1;
			x = 0.0875;
			y = 0.06;
			w = 0.825;
			h = 0.04;
		};
		
		class RscBackground : Life_RscText
		{
			colorBackground[] = {0.31,0.31,0.31,1};
			idc = -1;
			x = 0.0875;
			y = 0.12;
			w = 0.825;
			h = 0.82;
		};
		
		class RscTitleText : Life_RscTitle
		{
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "Die Serverregeln:";
			x = 0.0875;
			y = 0.06;
			w = 0.825;
			h = 0.04;
            class Attributes 
			{
				align = "center";
			};
		};
				
		class RsclolStatus : Life_RscStructuredText
		{
			idc = -1;
			colorBackground[] = {0, 0, 0, 0};
            sizeEx = 0.0001;
			text = "<t size = '0.8'>Taten die geahndet und zu sofortigen Bann führen.<br/> §1.1: Hacking/Cheating/Duping/Bugusing.<br/> §1.2: Selbstmord/Disconnect um sich dem Rollenspiel zu entziehen.<br/><br/> §2: Das Rollenspiel auf dem Altis Life Server steht an erster Stelle, wer dies nicht einhaelt wird Verwarnt<br/>und nach mehrmaliger Ermahnung gebannt.<br/><br/> §3: Wer die Regeln einer Safezone nicht beachtet oder verstößt wird ohne Vorwarnung permanent gebannt.<br/><br/> §4: RDM und VDM wird sofort geahndet und die Täter gebannt.<br/><br/> §5: Die Admins haben das letzt Wort<br/><br/></t><t font ='PuristaBold' size='0.9'>Um auf dem Altis Life Server zu spielen musst du diesen Regeln zustimmen und verpflichtest dich dazu diese einzuhalten.<br/>Die kompletten Regeln findest du wenn du auf der Karte.<br/>Homepage: staiylite.de<br/>TeamSpeak3: ts.staiylite.de</t>";
			x = 0.1125;
			y = 0.16;
			w = 0.775;
			h = 0.66;
		};	
	};
    
    	class Controls
	{
		class naz : Life_RscButtonMenu
		{
			idc = -1;
			text = "Nicht Akzeptieren";
			colorBackground[] = {0.09,0.55,0,1};
			onButtonClick = "closeDialog 0;";
			x = 0.1075;
            y = 0.88;
            w = 0.3;
            h = 0.04;
            class Attributes 
			{
				align = "center";
			};
		};
		
		
		class az : Life_RscButtonMenu
		{
			idc = -1;
			text = "Akzeptieren";
			colorBackground[] = {0.09,0.55,0,1};
			onButtonClick = "rulesok = true; closeDialog 0;";
            x = 0.5825;
            y = 0.88;
            w = 0.3;
            h = 0.04;
            class Attributes 
			{
				align = "center";
			};    
		};
	};
};