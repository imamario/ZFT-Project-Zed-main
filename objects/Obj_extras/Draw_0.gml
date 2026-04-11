draw_set_font(fnt_april)
draw_text_scribble(mouse_x,mouse_y,"[wobble]secret")
draw_set_font(global.font)

print(["mouse_x: " + string(mouse_x), "mouse_y: " + string(mouse_y)])