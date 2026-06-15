/// @description Fish Spawner
if (global.state == "paused")||(global.state == "cutscene") exit;
randomise();
if can_spawn && (instance_number(Obj_fish)<75){

	var _spawning=-100;
	var _spawnx;
	var _spawny;

	_spawnx=choose(room_width+100,-100);
	_spawny=random_range(room_height-100,100);
	instance_create_layer(_spawnx,_spawny,"enemies",Obj_fish);

}
if global.state!="rage"{alarm_set(0,random_range(5,40)); print("fish spawned: " + string(instance_number(Obj_fish)))}else  //random_range(5,30)) (og spawning rate for !rage) //5,60
{alarm_set(0,random_range(5,10));}

