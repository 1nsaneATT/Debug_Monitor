//Let Zeds know
[player,4,true,(getPosATL player)] spawn player_alertZombies;

//display gui (temp hint)


/*
Change the UID's below to match those of you and your admin(s)
Your admins will get the advanced version of your debug monitor,
while your regular users will get the cut down version. 
*/

if ((getPlayerUID vehicle player) in ["15517190","24681"]) then { 

	  hintSilent parseText format ["
	<t size='0.95' font='Bitstream' align='Center' color='#FFBF00'>[%18]</t><br/>
	<t size='0.95' font='Bitstream'>Survived %7 Days</t><br/>
	<t size='0.95' font='Bitstream' align='left'>Players: %8</t><t size='0.95 'font='Bitstream' align='right'>Within 500m: %11</t><br/>
	<t size='0.95' font='Bitstream' align='left' >Viewdistance:</t><t size='0.95'font='Bitstream'align='right'>%12</t><br/>
	<t size='0.95' font='Bitstream' align='left'>Vehicles:</t><t size='0.95' font='Bitstream'align='right'color='#13eedb'>%13(%14)</t><br/>
	<t size='0.95' font='Bitstream' align='left'>Air:</t><t size='0.95' font='Bitstream'align='right'>%16</t><br/>
	<t size='0.95' font='Bitstream' align='left'>Tank:</t><t size='0.95' font='Bitstream'align='right'>%15</t><br/>
	<t size='0.95' font='Bitstream' align='left'>Car:</t><t size='0.95' font='Bitstream'align='right'>%17</t><br/>
	<t size='0.95' font='Bitstream' align='left'>Zombies (alive/total): </t><t size='0.95' font='Bitstream' align='right'>%19/%20</t><br/>
	<t size='0.95' font='Bitstream' align='left'>Zombies Killed: </t><t size='0.95' font='Bitstream' align='right'>%2</t><br/>
	<t size='0.95' font='Bitstream' align='left'>Headshots: </t><t size='0.95' font='Bitstream' align='right'>%3</t><br/>
	<t size='0.95' font='Bitstream' align='left'>Murders: </t><t size='0.95' font='Bitstream' align='right'>%4</t><br/>
	<t size='0.95' font='Bitstream' align='left'>Bandits Killed: </t><t size='0.95' font='Bitstream' align='right'>%5</t><br/>
	<t size='0.95' font='Bitstream' align='left'>Humanity: </t><t size='0.95' font='Bitstream' align='right'>%6</t><br/>
	<t size='0.95' font='Bitstream' align='left'>Blood: </t><t size='0.95' font='Bitstream' align='right'>%9</t><br/>
	<t size='0.95' font='Bitstream' align='left'>FPS: %10</t><t size='0.95' font='Bitstream' align='right'>GPS: %22</t><br/>
	<t size='0.95'font='Bitstream'align='center'>%21</t><br/>",
	(name player),
	(player getVariable['zombieKills', 0]),
	(player getVariable['headShots', 0]),
	(player getVariable['humanKills', 0]),
	(player getVariable['banditKills', 0]),
	(player getVariable['humanity', 0]),
	(dayz_skilllevel),
	(count playableUnits),
	r_player_blood,
	(round diag_fps),
	(({isPlayer _x} count (getPos vehicle player nearEntities [["AllVehicles"], 500]))-1),
	viewdistance,
	(count([6800, 9200, 0] nearEntities [["StaticWeapon","Car","Motorcycle","Tank","Air","Ship"],25000])),
	count vehicles,
	(count([6800, 9200, 0] nearEntities [["Tank"],25000])),
	(count([6800, 9200, 0] nearEntities [["Air"],25000])),
	(count([6800, 9200, 0] nearEntities [["Car"],25000])),
	(gettext (configFile >> 'CfgVehicles' >> (typeof vehicle player) >> 'displayName')),
	(count entities "zZombie_Base"),
	({alive _x} count entities "zZombie_Base"),
	(getPosASL player),
	(mapGridPosition getPos player)
];

} else {

// Show the non-admin version to all other users

hintSilent parseText format ["
	<t size='1.20' font='Bitstream' color='#5882FA'>%1</t><br/><br/>
	<t size='1.15' font='Bitstream' color='#5882FA'>Survived %7 Days</t><br/>
	<t size='1.15' font='Bitstream' align='left'>Zombies Killed: </t><t size='1.15' font='Bitstream' align='right'>%2</t><br/>
	<t size='1.15' font='Bitstream' align='left'>Headshots: </t><t size='1.15' font='Bitstream' align='right'>%3</t><br/>
	<t size='1.15' font='Bitstream' align='left'>Murders: </t><t size='1.15' font='Bitstream' align='right'>%4</t><br/>
	<t size='1.15' font='Bitstream' align='left'>Bandits Killed: </t><t size='1.15' font='Bitstream' align='right'>%5</t><br/>
	<t size='1.15' font='Bitstream' align='left'>Zombies (alive/total): </t><t size='1.15' font='Bitstream' align='right'>%9/%8</t><br/>
	<t size='1.15' font='Bitstream' align='left'>Humanity: </t><t size='1.15' font='Bitstream' align='right'>%6</t><br/>",
	(name player),
	(player getVariable['zombieKills', 0]),
	(player getVariable['headShots', 0]),
	(player getVariable['humanKills', 0]),
	(player getVariable['banditKills', 0]),
	(player getVariable['humanity', 0]),
	(dayz_skilllevel),
	(count entities "zZombie_Base"),
	({alive _x} count entities "zZombie_Base")
];
};
