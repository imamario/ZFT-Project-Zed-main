/// @desc Create Objects on start
print("runned event_user 0")

switch(room) {
	
case Lv_akwarium_boss:

	instance_create_layer(-192,1056,"decorations",Obj_scientist)
	global.cutscene=true
	ycutscene_fix=-300
	target=Obj_scientist.pos

break;
	
	
	
}
if is_struct(target) {
	print("target is: " + string(target.Object))
} else {
	
	print("target is: " + string(target))
		
}