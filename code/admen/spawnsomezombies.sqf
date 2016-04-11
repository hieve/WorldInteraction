zedgrp = createGroup east;  
for "_i" from 0 to count allPlayers do          
{      
	"RyanZombieCrawler1Opfor" 
	createUnit 
	[ 
	screenToWorld getMousePosition,
	zedgrp
	];      
}; 