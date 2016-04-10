_sendmessage = true;
_exile = player getVariable ["ExileMoney", 0];
_costs = 5000;
_exile = _exile - _costs;
_basebuilding = ["Exile_Construction_Flag_Static"];
while{alive player}do{
	_nearbase = (nearestObjects [player,_basebuilding,15])-[player];
	_inRange = count _nearbase > 0;
	if(_inRange)then{
		if(_sendmessage)then{
			player sideChat "-- Custom Build Initiation --";
				_sendmessage = false;
				
		};
		player addAction [ "Build a barrier for 5000", { 
		"Land_HBarrierBig_F" createVehicle getpos player;
		format["setAccountMoney:%1:%2", _exile, (getPlayerUID player)] call ExileServer_system_database_query_fireAndForget;
		} ];
	};
};
		
		
		//tbd:
		
		//ExileServer_object_construction_network_buildConstructionRequest