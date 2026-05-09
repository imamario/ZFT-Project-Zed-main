anim = function(_anim){
	
	if (_anim = 0) { //STATE.READY (Free)
		image_blend=c_white
	
		img_angle[1]=lerp(img_angle[1],0,0.1) // bottom
		img_angle[0]=lerp(img_angle[0],-8.50,0.1) // upper
	
	}
	
	if (_anim = 1) { //STATE.ATTACKING (about to attack)
		
		var _open = 45
		var _closed = 15
		var _delay = 0.2
		
		img_angle[1]=lerp(img_angle[1],0,0.1) // bottom
		
		if img_angle=_closed{
		img_angle[0]=lerp(img_angle[0],_open,_delay)
		}else
		
		if (img_angle=_open){img_angle[0]=lerp(img_angle[0],_closed,_delay)}
		
	}
	
	if (_anim = 2) { //STATE.HITPOINT / STATE.COOLDOWN (the when attack already happened
	
		img_angle[1]=lerp(img_angle[1],0,0.1) // bottom
		img_angle[0]=lerp(img_angle[0],-10.50,0.1) // upper
		image_blend=c_gray
	
	}
	
	
}

/*
if (timer>0) { timer-=0.01 }
if instance_exists(Obj_player){depth=Obj_player.depth+1}

switch(curstate) {
	
case STATE.READY:

	anim(0);
	dangerous=0
	if place_meeting(x,y,Obj_player) {
		timer=20
		curstate=STATE.ATTACKING
	}



break;

case STATE.ATTACKING:

	anim(1)
	if (timer<0.1) { curstate=STATE.HITPOINT }

break;
	
case STATE.COOLDOWN:
	
	if (timer<0) || (timer=0)  { timer=10 }
	
	anim(2)
	dangerous=1
	if (timer<1) { curstate=STATE.READY }

break;	


case STATE.HITPOINT:

	if !place_meeting(x,y,Obj_player) { curstate=STATE.COOLDOWN }

break;




	
	
}

*/

if keyboard_check(ord("O")){x2+=0.5}
if keyboard_check(ord("P")){x2-=0.5}

if keyboard_check(ord("K")){y2+=0.5}
if keyboard_check(ord("L")){y2-=0.5}

if keyboard_check(ord("Y")){img_angle[0]+=0.5}
if keyboard_check(ord("U")){img_angle[0]-=0.5}

if keyboard_check(ord("G")){img_angle[1]+=0.5}
if keyboard_check(ord("H")){img_angle[1]-=0.5}

x=mouse_x
y=mouse_y


//[ "upper_x: 1923","upper_y: 1389","bottom_x: 1921","bottom_y: 1430","img_angle[0] (upper): -8.50","img_angle[1] (bottom): 0" ]