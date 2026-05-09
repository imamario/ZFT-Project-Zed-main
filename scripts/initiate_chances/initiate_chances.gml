// basically rare screens
randomise();
var _rooms = [Rm_extras]

if (random(500)>498){
	
	audio_play_sound(Snd_secretbonus,1,false)
	room_goto(_rooms[floor(random_range(array_length(_rooms),0))])
	
}