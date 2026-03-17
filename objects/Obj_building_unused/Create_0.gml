image_alpha=0
cam = view_camera[0];
cam_width = camera_get_view_width(cam);
cam_height = camera_get_view_height(cam);

left=0
right=0
up=0
down=0
movex=0
movey=0

building_mode=true
background_mode=false

cur_select=0
sprite=[Spr_pwalk,Spr_wall,Spr_water]
selected=sprite[cur_select]
click_positions = [];
added_img=noone

with(Obj_mouse){image_alpha=0}

grid_size = 32;