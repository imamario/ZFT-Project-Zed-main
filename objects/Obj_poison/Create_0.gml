randomise()
destruction=time_source_create(time_source_game,1000,time_source_units_frames,function(){instance_destroy()})
time = time_source_get_time_remaining(destruction)

image_xscale=0.5
image_yscale=0.5
img_spin=choose(1,-1)
range = 300

hspd=1
vspd=-15
size=0.3