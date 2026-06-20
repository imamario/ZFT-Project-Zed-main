var _back = check_click_btt(1343,64,1920,333)
var _video = check_click_btt(1343,64*2,1920,333*2)
var _audio = check_click_btt(1343,64*3,1920,333*3)

if _back {room_goto(Rm_menu)}



if state=="cutscene" && (point_distance(box_img.x, box_img.y, 0, 32)<0.1) && (point_distance(box_img.xscale, box_img.yscale, 1.729946, 1.598134)<0.03) {
	
	state = "running"	
	
}else{
	
var _delay = 0.1
	
box_img.x = lerp(box_img.x,0,_delay)
box_img.y = lerp(box_img.y,32,_delay)

box_img.xscale = lerp(box_img.xscale,1.729946,_delay)
box_img.yscale = lerp(box_img.yscale,1.598134,_delay)
	
	
}
print("state var: " +string(state))