randomise()
var _player = Obj_pfish
Atk_timer-=0.01

switch(Atk_state){
	case "cutscene":
	global.cutscene=true
	vul=0
	Atk_timer=999
	if (x<1024){x=lerp(x,1100,0.02) y=lerp(y,768,0.02)}else
	{x=1024 Atk_state="cutscene2"}
	break;
	
	case "cutscene2":
	global.cutscene=true
		y=lerp(y,1100,0.03)
	if (y>1056){y=1056 Atk_timer=5 poison_spawner=1 Atk_state="Poison_atk"}
	global.cutscene=false
	break;
	
	
	case "start":
	vul=0
	Atk_timer=999
	if (x<1024){x=lerp(x,1100,0.02) y=lerp(y,768,0.02)}else
	{x=1024 Atk_state="start2"}
	break;
	
	case "start2":
	y=lerp(y,1100,0.03)
	if (y>1056){y=1056 Atk_timer=5 poison_spawner=1 Atk_state="Poison_atk"}
	break;
	
	case "Poison_atk":
	poison_spawner-=0.01
	if (poison_spawner<0){instance_create_layer(_player.x,-20,"enemies",Obj_deathpoison) poison_spawner=1}
	if (Atk_timer<0){poison_spawner=999 Atk_state="Claw_atk"}
	break;
	
	case "Claw_atk":
	if !instance_exists(Obj_deathpoison){
	if (Atk_timer<0){Atk_timer=20}
	if (Atk_timer=20){instance_create_layer(x,-100,"enemies",Obj_oldclaw)}
	if !instance_exists(Obj_oldclaw){vul=1}
	if vul=1 && Obj_pfish.boss_atk=1
	{audio_play_sound(choose(Snd_scream1,Snd_scream2),1,false) Atk_timer=999 hp-- 
	image_xscale=random_range(5,10) image_yscale=random_range(5,10) Atk_state="Vulnerable"}
	}
	break;
	
	case "Vulnerable":
	vul=0
	image_xscale=lerp(image_xscale,3,0.1)
	image_yscale=lerp(image_yscale,3,0.1)

	if hp=0{global.w_timer=-1}
	if (x>-224){
		x=lerp(x,-300,0.02) y=lerp(y,768,0.02)}else
	{x=-224 y=768 if hp!=0{Atk_state="start"}}
	break;
}
//if Atk_state="start" && x=1024 && y=768{Atk_state="start2"}
