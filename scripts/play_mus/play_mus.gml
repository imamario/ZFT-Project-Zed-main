/// @description play_mus( audio, loop, volume);
/// @param audio
/// @param loop
/// @param volume
function play_mus(argument0,argument1,argument2){
	try{
		
		var _exists = variable_global_exists(global.state)
		
		if _exists{ 
			
			if !audio_is_playing(argument0) && global.state="running"{audio_play_sound(argument0,1,argument1,argument2)}
			
			switch(global.state){
				
				case "dead":
					
					audio_stop_sound(argument0)
					audio_play_sound(Snd_fail,1,true,argument2)
					
					break;
					
				case "rage":
					
					audio_stop_sound(argument0)
					audio_play_sound(Snd_ragedtheme,1,true,argument2)
					
					break;
					
				case "won":
					
					audio_stop_sound(argument0)
					audio_play_sound(Snd_success,1,true,argument2)
					
					break;
			
			}
			
		
		}
		
		
	}catch(_erro){
		
		show_message(_erro)
		
	}
}
//A

