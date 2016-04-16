_array = [["Exile_Melee_Axe",1],["Exile_Item_Bandage",25],[]   // list of items to be used

_fitem = _array call BIS_fnc_selectRandom;

addItem _fitem;