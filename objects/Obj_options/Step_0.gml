xdraw=lerp(xdraw,xto,0.05)
ydraw=lerp(ydraw,yto,0.05)

xdraw_scale=lerp(xdraw_scale,xscaleto,0.05)
ydraw_scale=lerp(ydraw_scale,yscaleto,0.05)

print(menu)

switch(menu) {
	 
	case TABS.INTRO:
	
		xto=32
		yto=64
		xscaleto=2.5//2.5
		yscaleto=1.2//1.2
		
		
		if (point_distance(xdraw,ydraw,xto,yto)<20) {
			
			menu=TABS.AUDIO		
			
		}
	
	break;
}


print("mouse_x: " + string(mouse_x))
print("mouse_y: " + string(mouse_y))




