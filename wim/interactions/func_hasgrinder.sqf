if{_hasGrinder}then{
			if(_fobject == "ironpipes_f.p3d")then{
				player playMove "AinvPknlMstpSnonWnonDr_medic3";
				uiSleep 4;
				hideObject cursorObject;
				_random = [8,0]call BIS_fnc_randomNum;
				_roundrandom = round _random;
				_metalpole = "weaponholdersimulated" createVehicle position player;
				_metalpole addItemCargoGlobal ["Exile_Item_MetalPole", _roundrandom];
				player removeAction _actionid;
				hint str "done";
				["<t color='##00ff00' size = '.8'Search the Ground for your Metal Pole/s",0,0.0,2,0] spawn bis_fnc_dynamictext;
			}else
			{
			["<t color='##00ff00' size = '.8'No metalpoles, but looks good",0,0.0,2,0] spawn bis_fnc_dynamictext;
			};
		}else
		{
			["<t color='##ffa500' size = '.8'You need a Grinder for that",0,0.0,2,0] spawn bis_fnc_dynamictext;
		};