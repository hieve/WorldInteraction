//***FTU***

_debug = true;
_detect = false;  
if(isNull cursorObject)then{}else{  																
	_actionModel = (getModelinfo cursorObject select 0); 									
	_array = 																			
	[  
	"crateswooden_f.p3d",  
	"ScrapHeap_1_F.p3d"
	];  
	_arraylength = (count _array-1);    												
	if(_debug)then{systemchat str _arraylength; };												
														

	for "_i" from 0 to _arraylength do  					
	{   
		if(_actionModel == _array select _i)then{ _detect = true;};  							
	};  
	if(_detect)then{player addAction["Ahction",[_actionModel] execVM "interactions/ahction.sqf"]; };	
}