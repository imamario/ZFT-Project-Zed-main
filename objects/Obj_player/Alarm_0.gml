/// @description Fish Spawner
/*
if (global.state == "paused")||(global.state == "cutscene") exit;
randomise();
if can_spawn && (instance_number(Obj_fish)<75){

	var _spawning=-100;
	var _spawnx;
	var _spawny;

	_spawnx=choose(room_width+100,-100);
	_spawny=random_range(room_height-100,100);
	

}
if global.state!="rage"{alarm_set(0,random_range(5,40)); print("fish spawned: " + string(instance_number(Obj_fish)))}else  //random_range(5,30)) (og spawning rate for !rage) //5,60
{alarm_set(0,random_range(5,10));}
*/


// Obj_player — Alarm[0]
randomise()


if (global.state == "paused" || global.state == "cutscene") exit;
var _phase = 0
if global.size < 1 {_phase = 1}





var _fish_cap = 75;
var _fish_count = instance_number(Obj_fish)
var _fish_count_size = [0, 0, 0];

with (Obj_fish) {

	if (size == 0.5) _fish_count_size[0]++;
    if (size == 1)   _fish_count_size[1]++;
    if (size == 1.5) _fish_count_size[2]++;

}

if (can_spawn && _fish_count < _fish_cap) {
    var _spawnx = choose(room_width + 100, -100);
    var _spawny = random_range(100, room_height - 100);

	if (_fish_count>_fish_count_size[1]) && (global.size < 1){
		
		
		with(instance_create_layer(_spawnx, _spawny, "Instances", Obj_fish)) {
	
			var _destroy = choose(0,1)
			if _destroy { instance_destroy() }
			
			image_index = round(random(4))
			
			size = 0.5
			type = 2
			draw_size = (size*sign(draw_size)) 
			image_yscale = size 
	
		}

	}else if (_fish_count<5) && (global.size < 1) {
		
	instance_create_layer(_spawnx, _spawny, "Instances", Obj_fish)
	
	}
	

    

    show_debug_message("Fish spawned: " + string(_fish_count + 1) + "/" + string(_fish_cap));
}

var _max_interval = (global.state == "rage") ? 10 : 40;
alarm[0] = irandom_range(5, _max_interval);