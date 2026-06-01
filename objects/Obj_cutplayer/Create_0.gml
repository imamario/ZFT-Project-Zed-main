//if !instance_exists(Obj_cam) { instance_create_depth(x,y,depth,Obj_cam) }
if (!variable_global_exists("cutscene")) {global.cutscene = false; global.state="cutscene";};
image_xscale = 0.6
image_yscale = 0.6
target = self



anim = {
	
	rotate : 0,
	ximage : image_xscale,
	yimage : image_yscale

}





//sprites specs
sprnormal = Spr_pwalk
spreating = Spr_peating
sprturning = Spr_pturning
sprtrail = Spr_trailbubble
sprblood = Spr_killplat
sprite_index=sprnormal

state = "none"


//function for making the eating animation
exe_eating = function(){

image_index=0
sprite_index=spreating;
audio_play_sound(choose(Snd_eat1,Snd_eat2,Snd_eat3,Snd_eat4),1,false,random_range(0.5,1.3),0,random_range(0.8,1.2));

}

//function for making the turning animation
exe_turn = function() {
		
		sprite_index = sprturning
		image_index = 0
		image_xscale = -image_xscale
		anim.ximage = -anim.ximage
		
}





switch(room) {
	
	case Lv_tutorial:
			
			
			image_speed = 0
			image_index = 3
			sprite_index = spreating
			state = "unawake"
			x=room_width/2;
			y=1800
			cutfish = [-200,(room_height/2)]
			timer = 0
			text = ["[wave][wheel]wake up...", -3]
			
			
	break;
	
	case Lv_akwarium_boss:
	
		state = "mid_walk";
		x=room_width/2;
		y=room_height/2;
		timer = 200
		target = Obj_oldscientist
	
	
	
	break;
	
	
	
}

// Camera dimensions
view_width = camera_get_view_width(view_camera[0])
view_height = camera_get_view_height(view_camera[0])

// Create the camera
camera = view_camera[0]

// Follow speed (0 = instant, 1 = no movement)
lerp_speed = 0.1;

cutscene_bar = 0
if !instance_exists(Obj_mus){instance_create_depth(x,y,depth,Obj_mus)}
