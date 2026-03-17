/// @description Fish Spawner
if can_spawn{
randomise();
var _spawning=-100;
var _spawnx;
var _spawny;

_spawnx=choose(room_width+100,-100);
_spawny=random_range(room_height-100,100);
instance_create_layer(_spawnx,_spawny,"enemies",Obj_fish);
}
alarm_set(0,30);

