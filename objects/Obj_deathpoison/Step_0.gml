event_inherited()
image_angle+=img_spin
destruction-=0.01
x+=hspd
y+=vspd
if destruction=0 || audio_is_playing(Snd_fail) || (y=room_height+100){instance_destroy()}
