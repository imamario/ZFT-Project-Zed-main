//alarm for glitchy text animation
randomise()
var _val = random_range(-45,45)

spin=lerp(spin,_val,0.1)
alarm_set(0,50)