{   _x setHit ["light_1_hitpoint", 0];   
_x setHit ["light_2_hitpoint", 0];   
_x setHit ["light_3_hitpoint", 0];  
 _x setHit ["light_4_hitpoint", 0];  } 
 forEach nearestObjects [player, [   "Lamps_base_F",   "PowerLines_base_F",   "PowerLines_Small_base_F"  ], 5];