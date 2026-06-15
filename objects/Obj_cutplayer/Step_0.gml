

switch(room) {
	
	case Lv_tutorial:
			
			switch(state) {
			
				case "unawake":
					
					x=lerp(x,room_width/2,0.1)
					y=lerp(y,1800,0.1)
					anim.rotate = lerp(anim.rotate,180,0.1)
					
					image_xscale=lerp(image_xscale,anim.ximage,0.07)
					image_yscale=lerp(image_xscale,anim.yimage,0.07)
					
					if keyboard_check_pressed(vk_anykey) || mouse_check_button_pressed(mb_any) {
						
						randomise()
						var _chance = random(10)
						x+=random_range(-5,5)
						y+=random_range(-5,5)
						anim.rotate=random_range(180-15,180+15)
						image_xscale=random_range(0.3,0.6)
						image_yscale=random_range(0.3,0.6)
						
						if (_chance>9) {  state = "awake" }
						
					}			
				break;
			
			
				case "awake":
					
					//timer--;
					global.cutscene=true
					anim.ximage=0.6;
					anim.yimage=0.6;
					image_xscale=lerp(image_xscale,anim.ximage,0.07);
					image_yscale=lerp(image_xscale,anim.yimage,0.07);
					sprite_index=sprnormal;
					image_speed=1;
					x=lerp(x,room_width/2,0.1);
					y=lerp(y,room_height/2,0.1);
					anim.rotate=lerp(anim.rotate,0,0.1);
					
					if (y<((room_height/2)+1)) { timer = 300 state="search" }
					
					
					
				
				break;
				
				case "search":
				
				print("searching")
				print(timer)
				if timer==300 || timer==200 || timer==100 {exe_turn()}
				timer--
				
				if (timer < 0){ state = "eat_fish" }
				
				
				break;
				
				case "eat_fish":
				
				print("eat_fish")
				print(cutfish[0])
				
				var _check = 100
				
				
				if (cutfish[0] > (x-_check))
				{exe_eating() print(image_xscale) cutfish[0]=room_width+100 state = "get_scared"}
				else{cutfish[0]+=20}
				
				
				break;
				
				
				case "get_scared":
				if (sign(image_xscale) == -1){ exe_turn() }
				if (sprite_index=spreating) || (sprite_index=sprturning)exit;
				
				
				
				
				if (sprite_index!=Spr_pscared) { exe_scared() }
				if image_index=2 {image_speed=0}else{image_speed=1}
				
				
				
				break;
				
			
			
			
			
			
			
			
			
			
			
			
			}
	break;

	case Lv_akwarium_boss:
	
	target = {Object: Obj_scientist, x: Obj_scientist.pos.x, y: Obj_scientist.pos.y-400}
	
	break;

	
	
	
}