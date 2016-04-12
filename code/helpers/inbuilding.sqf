_isInside = false;
if(isNull cursorObject)then{}else{
_type = cursorObject;


_errorMessageRoof  = "You are already on the roof";
_errorMessageInside  = "You are inside the Building";
_errorMessageDrive  = "Can't climb while driver";

_object = getposATL _type;
_objectx = _object  select 0;
_objecty = _object  select 1;
_objectz = _object  select 2;

_player = getposATL player;
_playerx = _player select 0;
_playery = _player select 1;
_playerz = _player select 2;




_objectbox = boundingBoxReal _type;
_objectboxNX = _objectbox select 0 select 0;
_objectboxNY = _objectbox select 0 select 1;
_objectboxNZ = _objectbox select 0 select 2;

_objectboxPX = _objectbox select 1 select 0;
_objectboxPY = _objectbox select 1 select 1;
_objectboxPZ = (_objectbox select 1 select 2)-1;


_obj = cursorObject;
_bbox = boundingBoxReal _obj;
_b1 = _bbox select 0;
_b2 = _bbox select 1;
_bbx = (abs(_b1 select 0) + abs(_b2 select 0));
_bby = (abs(_b1 select 1) + abs(_b2 select 1));


_objectboxNX = -(_bbx);
_objectboxNY = -(_bby);

_objectboxPX = _bbx;
_objectboxPY = _bby;
	

_objectheight = _objectboxPZ;

_PX = [(_objectx+_objectboxPX),_objecty];
_NX = [(_objectx+_objectboxNX),_objecty];
_PY = [_objectx,(_objecty+_objectboxPY)];
_NY = [_objectx,(_objecty+_objectboxNY)];


_P1XY = [(_objectx+_objectboxPX),(_objecty+_objectboxNY)];
_P2XY = [(_objectx+_objectboxPX),(_objecty+_objectboxPY)];
_N1XY = [(_objectx+_objectboxNX),(_objecty+_objectboxNY)];
_N2XY = [(_objectx+_objectboxNX),(_objecty+_objectboxPY)];

_P1XYZ = [(_objectx+_objectboxPX),(_objecty+_objectboxNY),_playerz];
_P2XYZ = [(_objectx+_objectboxPX),(_objecty+_objectboxPY),_playerz];
_N1XYZ = [(_objectx+_objectboxNX),(_objecty+_objectboxNY),_playerz];
_N2XYZ = [(_objectx+_objectboxNX),(_objecty+_objectboxPY),_playerz];

_P1XYNZ = [(_objectx+_objectboxPX),(_objecty+_objectboxNY),_objectboxNZ];
_P2XYNZ = [(_objectx+_objectboxPX),(_objecty+_objectboxPY),_objectboxNZ];
_N1XYNZ = [(_objectx+_objectboxNX),(_objecty+_objectboxNY),_objectboxNZ];
_N2XYNZ = [(_objectx+_objectboxNX),(_objecty+_objectboxPY),_objectboxNZ];

_P1XYPZ = [(_objectx+_objectboxPX),(_objecty+_objectboxNY),_objectboxPZ];
_P2XYPZ = [(_objectx+_objectboxPX),(_objecty+_objectboxPY),_objectboxPZ];
_N1XYPZ = [(_objectx+_objectboxNX),(_objecty+_objectboxNY),_objectboxPZ];
_N2XYPZ = [(_objectx+_objectboxNX),(_objecty+_objectboxPY),_objectboxPZ];

		
systemchat str ["position,height>object,player",_object,_objectheight,_player,_playerz];

	
_isInsideArea = [_object, [(_bbx),(_bby)], _player ] call BIS_fnc_isInsideArea;

systemchat str [_playerX,_playerY,_objectboxNX,_objectboxPX,_objectboxNY,_objectboxPY];



_xspread = _objectboxPX-_objectboxNX;
_yspread = _objectboxPY-_objectboxNY;
_size = [_xspread,_yspread];



	
hint str [_object,_player,_bbx,_bby,_xspread,_yspread,_P1XYPZ,_P2XYPZ,_N1XYPZ,_N2XYPZ ];





if(!(vehicle player == player))then { systemchat str _errorMessageDrive} else{
	if(_playerz >= _objectheight) then { systemchat str _errorMessageRoof} 
	else 
	{
	if(_isInsideArea) then { systemchat str _errorMessageInside} else { systemchat str "outside building" };
	} };
}
