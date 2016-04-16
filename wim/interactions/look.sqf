_unit = _this select 0;
_caller = _this select 1;
_actionid = _this select 2;
_fobject = _this select 3;

_detect = false;
_player = player;
_debugnr = 1;
_hasGrinder = "Exile_Item_Grinder" in (items _player + assignedItems _player + weapons _player);
_check = "some.p3d";
_cObject = getModelinfo(cursorObject)select 0;
[format["fobject:%1",(_fobject)],0,0.8,0.5,0,0,8] spawn BIS_fnc_dynamicText;
if(isNull cursorObject)then{['You pointed away',0,0.7,2,0] spawn bis_fnc_dynamictext;}else
{
	if(_cObject == _fobject)then
	{
		if(!ExilePlayerInSafezone)then
		{
			if(_fobject == "ironpipes_f.p3d" || _fobject == "Pipes_large_F.p3d" || _fobject ==  "Sunshade_01_F.p3d" || _fobject == "Sunshade_02_F.p3d" || _fobject == "Sunshade_03_F.p3d" || _fobject == "sunshade_f.p3d" || _fobject == "Sunshade_04_F.p3d")then
			{
				player playMove "AinvPknlMstpSnonWnonDr_medic3";
				hideObject cursorObject;
				_random = round([8,1]call BIS_fnc_randomNum);
				container = createVehicle ["weaponholdersimulated", position player, [], 0, "NONE"];
				container addItemCargoGlobal ["Exile_Item_MetalPole", 5];
				player removeAction _actionid;
				uiSleep 4;
				hint str "done";
				['You successful gathered Metal Pole/s',0,0.7,2,0] spawn bis_fnc_dynamictext;
			}else
			{
				if(_fobject == "pallet_f.p3d" || _fobject == "bricks_v4_f.p3d" || _fobject == "bricks_v1_f.p3d" || _fobject == "bricks_v2_f.p3d" || _fobject == "bricks_v3_f.p3d")then{
					player playMove "AinvPknlMstpSnonWnonDr_medic3";
					hideObject cursorObject;
					_random = round([3,1]call BIS_fnc_randomNum);
					container = createVehicle ["weaponholdersimulated", position player, [], 0, "NONE"];
					container addItemCargoGlobal ["Exile_Item_WoodPlank", 5];
					player removeAction _actionid;
					uiSleep 4;
					hint str "done";
					['You successful gathered Wood Planks',0,0.7,2,0] spawn bis_fnc_dynamictext;
				}else
				{
					['#WARN#01#You cannot gather anything from here',0,0.7,2,0] spawn bis_fnc_dynamictext;
				};
			};	
		}
		else
		{
			['Cannot do that while in Safezone',0,0.7,2,0] spawn bis_fnc_dynamictext;
			player removeAction _actionid;
		};
	}else{['You pointed away',0,0.7,2,0] spawn bis_fnc_dynamictext;};
};

