var _move = (-keyboard_check_pressed(vk_left) +keyboard_check_pressed(vk_right))
serial_number+=_move
serial_number=clamp(serial_number,0,array_length(concept))