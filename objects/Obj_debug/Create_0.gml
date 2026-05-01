enabled=false
lastpos={
	
	x: Obj_player.x ?? 0,
	y: Obj_player.y ?? 0

}

the_string = "abc|def||ghi|jkl|mno|pqrs|tuv|wxyz";
string_parts = string_split(the_string, "|", true, 5);

show_debug_message_ext("{0}, {1}, {2}, {3}, {4}", string_parts);



