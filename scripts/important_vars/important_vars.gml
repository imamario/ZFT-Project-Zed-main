global.save=[0,1] //stage and level
global.level = [0,0] //stage and level

global.font = font_add_sprite_ext(Spr_font,"$qc.?!()wemavk8o9gzx2ruj6ydnb0ps47l%/1iht3f5v÷+×='_-:",true,0)

draw_set_font(global.font)
draw_set_halign(fa_center)
draw_set_valign(fa_center)

/*
function mods_folder(){
if !directory_exists("Mods"){
directory_create("Mods")};
};
*/
//function tittle_background(){
	
//	static bg = choose(Spr_tittlebg,)
	
//}

function save() {
	
	print("old global.save: " + string(global.save))
	
    var _olddata = [0, 0];
    
    // 1. READ existing data
    if (file_exists("save.txt")) {
        var _file_read = file_text_open_read("save.txt");
        var _raw_string = file_text_read_string(_file_read); // Read the WHOLE array string
        _olddata = json_parse(_raw_string); // Turn "[0,0]" back into an array [0,0]
        file_text_close(_file_read);
    }

    var _data = global.level; // Current [stage, level]
    
    // 2. COMPARE (Progression Logic)
    // Checking if stage is higher OR if same stage but level is higher
    var _is_further = (_data[0] > _olddata[0]) || (_data[0] == _olddata[0] && _data[1] > _olddata[1]);

    if (_is_further) {
        var _file_write = file_text_open_write("save.txt");
        
        // This turns your array [1, 4] into the string "[1, 4]" 
        // and writes it in ONE line. No splitting required!
        file_text_write_string(_file_write, json_stringify(_data));
        
        file_text_close(_file_write);
        global.save = _data;
    } else {
        global.save = _olddata;
    }
	
	print("new global.save: " + string(global.save))
	
}
save()

