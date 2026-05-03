if anim_yscale!=1{anim_yscale=lerp(anim_yscale,1,0.1)}

if anim_y>1 {anim_y=lerp(anim_y,0,0.07)}
else 
{
	
	if (img_alpha<1){img_alpha+=0.03}
	
}

var _button = [

	//top left
	point_in_rectangle(mouse_x,mouse_y,positions[0].xcol,positions[0].ycol,positions[0].x2col,positions[0].y2col),
	//top right
	point_in_rectangle(mouse_x,mouse_y,positions[1].xcol,positions[1].ycol,positions[1].x2col,positions[1].y2col),
	//bottom left
	point_in_rectangle(mouse_x,mouse_y,positions[2].xcol,positions[2].ycol,positions[2].x2col,positions[2].y2col),
	//bottom right
	point_in_rectangle(mouse_x,mouse_y,positions[3].xcol,positions[3].ycol,positions[3].x2col,positions[3].y2col),
	//middle button
	point_in_rectangle(mouse_x,mouse_y,positions[4].xcol,positions[4].ycol,positions[4].x2col,positions[4].y2col),
	//arrow to select level left
	point_in_rectangle(mouse_x,mouse_y,0,190,205,895),
	//arrow to select level right
	point_in_rectangle(mouse_x,mouse_y,1715,190,1890,895)
	
	
	
]

switch(cur_stage[0]) {
	
	default:
	cur_stage[1] = Rm_extras
	cur_stage[3] = "how are you here?"
	break;
	
	case 0:
	cur_stage[1] = Lv_akwarium
	cur_stage[3] = "akwarium"
	break;
	
	case 1:
	cur_stage[1] = Lv_Toiletdoom
	cur_stage[3] = "toilet of doom"
	break;
	
	case 2:
	cur_stage[1] = Lv_Toiletdoom
	cur_stage[3] = "pipes of fury"
	break;
	
	case 3:
	cur_stage[1] = Lv_Toiletdoom
	cur_stage[3] = "waste waters"
	break;
	
	case 4:
	cur_stage[1] = Lv_Toiletdoom
	cur_stage[3] = "mutant river"
	break;
	
	case 5:
	cur_stage[1] = Lv_Toiletdoom
	cur_stage[3] = "freak wreak"
	break;
	
	case 6:
	cur_stage[1] = Lv_Toiletdoom
	cur_stage[3] = "alien temple"
	break;
	
	case 7:
	cur_stage[1] = Lv_Toiletdoom
	cur_stage[3] = "waterfall bay"
	break;
	
	case 8:
	cur_stage[1] = Lv_Toiletdoom
	cur_stage[3] = "monster guts"
	break;

	case 9:
	cur_stage[1] = Lv_Toiletdoom
	cur_stage[3] = "storm of destruction"
	break;
	
}



if mouse_check_button_pressed(mb_left) {
	
	if (cur_stage[0]<max_stage) || (cur_stage[0]=max_stage)  {
	
		if _button[0] && (max_level>0)  {
	
			global.level=[cur_stage[0],0]
			room_goto(cur_stage[1])
	
		}
	
		if _button[1] && (max_level>1) {
	
			global.level=[cur_stage[0],1]
			room_goto(cur_stage[1])
	
		}
	
		if _button[2] && (max_level>2) {
	
			global.level=[cur_stage[0],2]
			room_goto(cur_stage[1])
	
		}	

		if _button[3] && (max_level>3) {
	
			global.level=[cur_stage[0],3]
			room_goto(cur_stage[1])
	
		}
	
		if _button[4] && (max_level>4) {
		
			global.level=[cur_stage[0],4]
			room_goto(cur_stage[1])
		
		}
	}
	
	if _button[5] {
		
		anim_yscale=-1
		cur_stage[0]--
		
	}
	
	if _button[6] {
		
		anim_yscale=-1
		cur_stage[0]++
		
	}
		
		
	
	print(global.level)
	
}

/*
if mouse_check_button_pressed(mb_left) {


	for(var i = 0; i < array_length(_button) ; i++) {

		print("_button[" + string(i) + "]: " + string(_button[i]))
		print("Values of _button[" + string(i) + "]: " + string(array_contains(_button,i)))
	}
	
}
*/