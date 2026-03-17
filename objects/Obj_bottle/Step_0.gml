if !instance_exists(Obj_player)exit;

iv_frames--;
image_angle++
if iv_frames<200{image_alpha=0};
depth=Obj_player.depth+10
y+=5;