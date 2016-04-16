_unit = _this select 0;
_caller = _this select 1;
_actionid = _this select 2;
_fobject = _this select 3;

_detect = false;
_player = player;
_debugnr = 1;
_hasGrinder = "Exile_Item_Grinder" in (items _player + assignedItems _player + weapons _player);
_check = "some.p3d";

_array = nearestObjects [_player,[],5];
_arraylength = (count _array)-1;
if(_debugnr==1)then{hint format ["PREDEBUG---Assigned to:%1<br>Called by:%2<br>ID:%3<br>Object:%4<br>Debug:%5<br>Detection:%6<br>NearPlayerArrayNr%7FirstArrayValue%8LastArrayValue%9",_unit,_caller,_actionid,_fobject,_debugnr,_detect,_arraylength,_array select 0,_array select _arraylength];}else{};

if(_arraylength > 0)then
{
	for "_i" from 0 to _arraylength do  																				
				{   
					
					if(isNull (_array select _i))then{["<t color='##00ff00' size = '.8'isnull in array",0,0.0,2,0] spawn bis_fnc_dynamictext;}else
					{
						_check = getModelInfo(_array select _i)select 0;
						["<t color='##00ff00' size = '.8'ok before check",0,0.0,2,0] spawn bis_fnc_dynamictext;
						if(_fobject isEqualTo _check)then																				
						{
							_detect = true;
							_fobject = _array select _i;
							["<t color='##00ff00' size = '.8'all good",0,0.0,2,0] spawn bis_fnc_dynamictext;

						}
						else
						{
						["<t color='##00ff00' size = '.8'check gone wrong",0,0.0,2,0] spawn bis_fnc_dynamictext;
						};
					};
				};					
}
else{["<t color='#ff0000' size = '.8'>There is nothing near you to do this",0,0.0,2,0] spawn bis_fnc_dynamictext;};
if(_detect)then{hint str "We found something";}else{["<t color='##00ff00' size = '.8'found nothing",0,0.0,2,0] spawn bis_fnc_dynamictext;};
if(!ExilePlayerInSafezone)then
{
	["<t color='##00ff00' size = '.8'all good",0,0.0,2,0] spawn bis_fnc_dynamictext;
}
else
{
	["<t color='#ff0000' size = '.8'>Can not do that while in SafeZone",0,0.0,2,0] spawn bis_fnc_dynamictext;
	player removeAction _actionid;
};

