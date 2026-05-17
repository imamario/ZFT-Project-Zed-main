if (!FOLLOW_MOUSE)exit;
range=100
water_colision = function() {

	if (point_distance(x, y, mouse_x, mouse_y) < range) {return true}else{return false}
		
}