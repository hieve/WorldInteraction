_unit = _this select 0;
_caller = _this select 1;
_actionid = _this select 2;
_fobject = _this select 3;
_cobject = cursorObject;

systemchat format ["Assigned to:%1Called by:%2ID:%3Object:%4",_unit,_caller,_actionid,_fobject];



if (_cobject == _fobject) then  
{
	player playMove "AinvPknlMstpSnonWnonDr_medic3";
    uiSleep 4;
	hideObject _fobject;
    ["Success",["Search the ground for your Items"]] call ExileClient_gui_notification_event_addNotification;
    _wood = "weaponholdersimulated" createVehicle position player;
    _wood addItemCargoGlobal ["Exile_Item_WoodLog", 4];
}
else		
{
	["Whoops",["You pointed away from the Object"]] call ExileClient_gui_notification_event_addNotification;
};


player removeAction _actionid;


//_nObject = nearestTerrainObjects [player, ["Land_woodenbox_f"], 3];
//_nWood = _nObject select 0;
private["_actionName","_parameters"];
_actionName = _this select 0;
_parameters = _this select 1;


if (_cobject == _parameters) then  
{
	player playMove "AinvPknlMstpSnonWnonDr_medic3";
    uiSleep 4;
	hideObject _parameters;
    ["Success",["Search the ground for your packed Wood"]] call ExileClient_gui_notification_event_addNotification;
    _wood = "weaponholdersimulated" createVehicle position player;
    _wood addItemCargoGlobal ["Exile_Item_WoodLog", 4];
}
else		
{
	["Whoops",["You pointed away from the Wood"]] call ExileClient_gui_notification_event_addNotification;
};