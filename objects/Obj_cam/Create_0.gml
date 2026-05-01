// Camera setup
alarm_set(0,200)
spin=0


image_alpha=0
enablejoystick=0.5
global.cutscene=false

cam = view_camera[0];
cam_width = camera_get_view_width(cam);
cam_height = camera_get_view_height(cam);
res=""
xcutscene_fix=0
ycutscene_fix=0
// Set follow target
target = 0;
xto=x
yto=y;

xresult=0
yresult=0
depth=-99999

jawdraw=0
color=0
color_trans = 0

a=0

// --- DEFINE YOUR MAP BOUNDARIES ---
// Set these to the coordinates of your room
