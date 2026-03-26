// check resolution of the camera view (used only for external objects like hud ,victory screen, ect)
switch(camera_get_view_width(cam)){
case 1920:
res="1080p"
break;
	case 2560:
	res="1440p"
	break;
		case 3840:
		res="4k"
		break;
}	
//show_debug_message("resolution: " + string(res))
var _a = lerp(jawdraw,Obj_player.combo_info[0],0.1)
_a = clamp(_a,0,70)
jawdraw=_a


// 1. Check if target exists
if global.cutscene==false{target=Obj_player xcutscene_fix=0 ycutscene_fix=0}
if (!instance_exists(target)) exit;


// 2. Update target destination
if global.state="running" || global.state="rage"{
	xto = target.x+xcutscene_fix;
    yto = target.y+ycutscene_fix;
} else {
    xto = room_width/2
    yto = room_height/2
}

x = lerp(x,xto,0.1)
y = lerp(y,yto,0.1)

// 4. Lock the camera object inside the "Safe Zone" 
// This prevents it from going into "free mode" at the corners
x = clamp(x, cam_width * 0.5, room_width - (cam_width * 0.5));
y = clamp(y, cam_height * 0.5, room_height - (cam_height * 0.5));

// 5. Final positioning (Centered)
camera_set_view_pos(view_camera[0], x - (cam_width * 0.5), y - (cam_height * 0.5));

