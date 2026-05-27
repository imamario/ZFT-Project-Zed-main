if !variable_global_exists("size")exit;
draw_sprite_ext(Spr_bottom_shell,0,2544,1514,image_xscale,image_yscale,(img_angle[1]),image_blend,1) //bottom
draw_sprite_ext(Spr_upper_shell,0,x,y,image_xscale,image_yscale,img_angle[0],image_blend,1) //upper
/*
print([
"upper_x: " + string(x),
"upper_y: " + string(y),
"bottom_x: " + string(x+x2),
"bottom_y: " + string(y+y2),

"bottom_x: " + string(x+x2),
"bottom_y: " + string(y+y2),

"img_angle[0] (upper): " + string(img_angle[0]),
"img_angle[1] (bottom): " + string(img_angle[1]),

"depth: " + string(depth)
])

draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,true)
*/