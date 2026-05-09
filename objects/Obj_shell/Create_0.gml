event_inherited()

active=true // for not activating in stages like the akwarium boss stage
dangerous=0
offset=-8
img_angle=[0+offset,0] //upper, bottom
x=2545
y=1460
image_xscale=1.3
image_yscale=1.3


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