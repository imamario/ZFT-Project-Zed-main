left=InputCheck(INPUT_VERB.LEFT);
right=InputCheck(INPUT_VERB.RIGHT);
down=InputCheck(INPUT_VERB.DOWN);
up=InputCheck(INPUT_VERB.UP);
sprint=InputCheck(INPUT_VERB.SPRINT);
sneak=InputPressed(INPUT_VERB.SNEAK)
if keyboard_check(ord("R")){room_restart()};
randomise();

if sneak{sneaking=!sneaking}

// --- MOVEMENT --- //

if !sneaking && sprint{
	spd=20;
}else if sneaking && !sprint{
	spd=3	
}else{spd=10};

show_debug_message(spd)

_xdir= ((-left +right));
_ydir= ((+down -up));

if powerup[1]!=0{
xto+=_xdir*spd;
yto+=_ydir*spd;
}else{
xto-=_xdir*spd;
yto-=_ydir*spd;
}
	
	
	
movex=lerp(x,xto,delay);
movey=lerp(y,yto,delay);

// --- HORIZONTAL COLLISION --- //
if (place_meeting(movex, y, Obj_wall)) {
    // Inch closer to the wall pixel by pixel until flush
    var _dir_x = sign(movex - x);
    while (!place_meeting(x + _dir_x, y, Obj_wall)) {
        x += _dir_x;
    }
    movex = x; // Stop the actual movement
    xto = x;   // Kill the lerp target momentum
}
x = movex;

// --- VERTICAL COLLISION --- //
if (place_meeting(x, movey, Obj_wall)) {
    // Inch closer to the wall pixel by pixel until flush
    var _dir_y = sign(movey - y);
    while (!place_meeting(x, y + _dir_y, Obj_wall)) {
        y += _dir_y;
    }
    movey = y; // Stop the actual movement
    yto = y;   // Kill the lerp target momentum
}
y = movey;


// --- SPRITE AND ANGLE LOGIC --- //
if _xdir=-1 && draw_xscale!=-global.size{
	if sprite_index!=Spr_peating{
	draw_xscale=-global.size;draw_yscale=global.size;sprite_index=Spr_pturning; image_index=0;
	}	else	{
		draw_xscale=draw_xscale;
	}
}

if _xdir=1 && draw_xscale!=global.size{
	if sprite_index!=Spr_peating{
		draw_xscale=global.size;draw_yscale=global.size;sprite_index=Spr_pturning; image_index=0;
	}	else	{
		draw_xscale=draw_xscale;
	};
};

//	--- FLIP IMAGE ANGLE ---	//

if draw_xscale=global.size{
draw_angle=lerp(draw_angle,-_ydir*50,delay);
}else if draw_xscale=-global.size{
draw_angle=lerp(draw_angle,_ydir*50,delay);
};

// --- TRAIL LOGIC --- //

// 1. ADDING TO THE TRAIL
// Check if we are sprinting AND actually moving (x or y changed)
if (sprint && (x != xprevious || y != yprevious)) { 
    trail_timer++;
    
    // Once the timer hits our interval, drop a new ghost
    if (trail_timer >= trail_interval) {
        trail_timer = 0;
        
        // Create a struct containing the player's exact visual state
        var _ghost = {
            t_x: x,
            t_y: y,
            t_sprite: sprite_index,
            t_frame: image_index,
            t_xscale: draw_xscale,
            t_yscale: draw_yscale,
            t_angle: draw_angle,
            t_alpha: trail_starting_alpha
        };
        
        array_push(trail_list, _ghost);
    }
} else {
    // Reset timer if we stop moving or stop sprinting
    trail_timer = 0; 
}

// 2. FADING AND CLEANING UP THE TRAIL (Runs ALWAYS)
for (var i = array_length(trail_list) - 1; i >= 0; i--) {
    // Reduce the alpha
    trail_list[i].t_alpha -= trail_fade_speed;
    
    // Delete fully invisible ghosts to save memory
    if (trail_list[i].t_alpha <= 0) {
        array_delete(trail_list, i, 1);
    }
}


//IF DEAD
if global.state="dead"{x=9999 y=-9999 global.size=0};
//show_debug_message(alarm[2]);

//	--- EATING ENEMIES ---	//
if global.state="running"{
	var _fish = instance_place(x,y,Obj_fish);//set to check which instance is meeting
	if _fish{
	if _fish.size<global.size || _fish.size=global.size{//checks if player is bigger than the fish
		
	alarm_set(1,100);combo_info[1]++;combo_info[3]++;//increase combo timer combo counter total eaten and size of the player
	global.size+=global.growth;
	
	image_index=0;	Obj_player.sprite_index=Spr_peating;//play eating animation
	
	audio_play_sound(choose(Snd_eat1,Snd_eat2,Snd_eat3,Snd_eat4),1,false,random_range(0.5,1.3),0,random_range(0.8,1.2));//play a sound
	
	var _bottlespawn=random(11);
	if _bottlespawn>10{instance_create_layer(x,y,"Instances",Obj_bottle)};
	
	instance_destroy(_fish);
	
	}else if _fish.size>global.size{
	global.state="dead" audio_play_sound(Snd_jaw,1,false)};
	};
};

//	--- COMBO ---	//

combo_info[0]=alarm[1];
if combo_info[0]>0{
	if (combo_info[1]>combo_info[2]){combo_info[2]=combo_info[1]}else{combo_info[2]=combo_info[2]};
}else{combo_info[1]=0};

//	--- POWERUPS ---	//
var _bottle = instance_place(x,y,Obj_bottle);

if _bottle{
	if _bottle.iv_frames<900{
	alarm_set(2,2500)
	powerup[0]=true;
	powerup[1]=_bottle.image_index;
	instance_destroy(_bottle);
	};
};

if alarm[2]<1{
	alarm_set(2,-1);
	powerup[0]=false;
	powerup[1]=-1;
};

