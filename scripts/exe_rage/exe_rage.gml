

function exe_rage() {
	
	static _exe = false
	_bg = layer_background_get_id("Background")
	
	_exe=!_exe
	
	
	
	
	//if (!_exe) {
	
		if (global.state="rage" && _exe) {
	
			layer_background_blend(_bg,c_gray)
			//image_blend=c_maroon
			layer_enable_fx("Rage_eff",true)
			return true
			
			
		}else{
	
			layer_background_blend(_bg,c_white)
			//image_blend=c_white
			layer_enable_fx("Rage_eff",false)
			return false
			
	//	};
		
		
	};
	
};