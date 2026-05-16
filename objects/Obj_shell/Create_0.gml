event_inherited()

active=true // for not activating in stages like the akwarium boss stage
dangerous=0
offset=-8
img_angle=[0+offset,0] //upper, bottom
x=2545
y=1460
image_xscale=1.3
image_yscale=1.3
depth=299


anim = 0


//[ "upper_x: 2545","upper_y: 1460","bottom_x: 2544","bottom_y: 1514","img_angle[0] (upper): -8","img_angle[1] (bottom): 0" ]



x2=0
y2=0



 
enum STATE {

	READY, // for when is free to attack
	ATTACKING, // play animation of attacking
	HITPOINT, // hit in hurt box when done with STATE.ATTACKING
	RETURNING, // doing animation to go back to intial idle animation (same from STATE.READY)
	COOLDOWN // cooldown for go back to initial state of ready
	
}

curstate=STATE.READY
timer=0
alarm_set(0,100)


anim_toggle=false //false = closed, true = open
anim = function(_anim){
	
		var _open = -30
		var _closed = -8.50		
		var _delay = 0.05
	
	
	if (_anim = 0) { //STATE.READY (Free)
		image_blend=c_white
		
		x=lerp(x,2545,_delay)
		y=lerp(y,1460,_delay)
	
		img_angle[1]=lerp(img_angle[1],0,0.1) // bottom
		img_angle[0]=lerp(img_angle[0],-8.50,0.1) // upper
	
	}
	
	if (_anim = 1) { //STATE.ATTACKING (about to attack)
		

		
		img_angle[1]=lerp(img_angle[1],0,0.1) // bottom
		
		if anim_toggle=false{
			
			
			x=lerp(x,2580,_delay)
			y=lerp(y,1420,_delay)
			
			img_angle[0]=lerp(img_angle[0],_open,_delay);
			if img_angle[0]==_open{anim_toggle=!anim_toggle};
		
		}else
		
		if anim_toggle=true{
			
			
			x=lerp(x,2545,_delay)
			y=lerp(y,1460,_delay)
			
			img_angle[0]=lerp(img_angle[0],_closed,_delay);
			if img_angle[0]==_closed{anim_toggle=!anim_toggle};	
			
		}
		
	}
	
	if (_anim = 2) { //STATE.HITPOINT / STATE.COOLDOWN (the when attack already happened
		
		x=lerp(x,2545,1)
		y=lerp(y,1460,1)
	
		img_angle[1]=lerp(img_angle[1],0,1) // bottom
		img_angle[0]=lerp(img_angle[0],-10.50,1) // upper
		image_blend=c_gray
	
	}
	
	
}