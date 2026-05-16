


xdraw=lerp(xdraw,xto,0.05)
ydraw=lerp(ydraw,yto,0.05)

xdraw_scale=lerp(xdraw_scale,xscaleto,0.05)
ydraw_scale=lerp(ydraw_scale,yscaleto,0.05)

print(cur_tab)

switch(cur_tab[0]) {
	 
	case TABS.NONE:
	
		xto=32
		yto=64
		xscaleto=2.5//2.5
		yscaleto=1.2//1.2
		
		
		if (point_distance(xdraw,ydraw,xto,yto)<20) {
			
			cur_tab[0]=0		
			
		}
	
	break;
}
cur_tab[0]+= (-keyboard_check_pressed(ord("Q")) +keyboard_check_pressed(ord("E")))
if cur_tab[0]!=TABS.NONE {
cur_tab[0]=clamp(cur_tab[0],0,1)
}

print("mouse_x: " + string(mouse_x))
print("mouse_y: " + string(mouse_y))




