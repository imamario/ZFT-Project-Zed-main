var _player = Obj_pfish
var _target = Obj_bossdmgarea
var _camera = Obj_cam
var _cameraboundaries = noone

if object_exists(Obj_scientist){
//if Obj_scientist.vul=1{image_alpha=1}else{image_alpha=0}
image_angle = (point_direction(_player.x,_player.y,_target.x,_target.y) - 90)
if Obj_scientist.vul=1{image_alpha=1}else{image_alpha=0}}