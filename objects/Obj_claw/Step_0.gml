var _spd = 0.03
var _range = 100

timer_death = clamp(timer_death,0,9999)
if place_meeting(x,y,Obj_player) { timer_death+=0.05 } else { timer_death-=0.02 }
//image_alpha=timer_death
print(timer_death)
if 



x = lerp(x,Obj_player.x,_spd)
y = lerp(y,Obj_player.y,_spd)




/*
event_inherited()
/*if place_meeting(x,y,Obj_pfish){met=1}
if met=1{destroy--}
if destroy<0{instance_destroy()}
*/
//if Obj_scientist.Atk_timer=19.9{}
/*
if Obj_scientist.Atk_timer>10
{move_towards_point(Obj_pfish.x,Obj_pfish.y,4.5)}else
{move_towards_point(Obj_scientist.x,-500,20) if y<-300{show_debug_message("claw_destroyed") instance_destroy()}}
*/
/*
var _scient = Obj_scientist
var _player = Obj_player

if _scient.Atk_timer>10
{x=lerp(x,_player.x,spd) y=lerp(y,_player.y,spd)}else{ dangerous=0
x=lerp(x,_scient.x,0.01) y=lerp(y,-1000,0.01) if y<-300{show_debug_message("claw_destroyed") instance_destroy()}
}*/












