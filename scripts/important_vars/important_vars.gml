global.save=0
global.font = font_add_sprite_ext(Spr_font,"$qc.?!()wemavk8o9gzx2ruj6ydnb0ps47l%/1iht3f5v÷+×='_-:",true,0)
draw_set_halign(fa_center)
draw_set_valign(fa_center)

/*
function mods_folder(){
if !directory_exists("Mods"){
directory_create("Mods")};
};
*/
function tittle_background(){
	
	static bg = choose(Spr_tittlebg,)
	
}
 
function save(){
    var _olddata = 0;
    
    // 1. Open to READ existing data first
    if (file_exists("save.txt")) {
        var _file_read = file_text_open_read("save.txt");
        _olddata = file_text_read_real(_file_read);
        file_text_close(_file_read); // Close after reading
    }

    var _data = 0;
        if (room == Akwarium1_Bossroom)      { _data = 0.5; }
        if (room == Toiletdoom_bossroom)   { _data = 1.5; }
        if (room == Sewers_boss)           { _data = 2.5; }
    
    // 2. Compare and only WRITE if the new data is higher
    if (_data > _olddata) {
        var _file_write = file_text_open_write("save.txt");
        file_text_write_real(_file_write, _data);
        file_text_close(_file_write); // Close after writing
        global.save = _data;
    } else {
        global.save = _olddata;
    }
}



