if image_angle>10 || image_angle<-10 {
	img_turn=-img_turn
}

if y<735 || y>800 {img_spd=-img_spd}

image_angle+=img_turn
y+=img_spd