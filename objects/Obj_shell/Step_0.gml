

if (global.size>0.8){anim(0) exit;}

if (timer>0) { timer-=0.1 }
if instance_exists(Obj_player){depth=Obj_player.depth+1}

switch(curstate) {
	
case STATE.READY:
	
	dangerous=0;
	anim(0);
	if place_meeting(x,y,Obj_player) {
		timer=30
		curstate=STATE.ATTACKING
	}



break;

case STATE.ATTACKING:

	anim(1);
	if (timer<0.1) { curstate=STATE.HITPOINT };

break;
	
case STATE.COOLDOWN:
	
	if (timer<0) || (timer=0)  { timer=50 }
	
	anim(2);
	dangerous=0;
	if (timer<1) { curstate=STATE.READY }

break;	


case STATE.HITPOINT:
	anim(1);
	if !place_meeting(x,y,Obj_player) { curstate=STATE.COOLDOWN }else{dangerous=1 global.state="dead"}

break;

}
/*
if keyboard_check(ord("O")){x+=0.5}
if keyboard_check(ord("P")){x-=0.5}

if keyboard_check(ord("K")){y+=0.5}
if keyboard_check(ord("L")){y-=0.5}

if keyboard_check(ord("Y")){img_angle[0]+=0.5}
if keyboard_check(ord("U")){img_angle[0]-=0.5}

if keyboard_check(ord("G")){img_angle[1]+=0.5}
if keyboard_check(ord("H")){img_angle[1]-=0.5}
*/