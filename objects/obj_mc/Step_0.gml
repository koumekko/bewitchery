	if (left_move or right_move or up_move or down_move) {
		can_move = false;
		supersex+= 0.25;
		sex+=0.25
	}
	
	//keypresses
	move_wrap(true, true, 0)
	if ((keyboard_check_pressed(ord("S")) and !place_meeting(x, y + 27, obj_wall)) and can_move) {
		key_presses++
	}
	if ((keyboard_check_pressed(ord("W")) and !place_meeting(x, y - 27, obj_wall)) and can_move) {
		key_presses++
	}
	if ((keyboard_check_pressed(ord("A")) and !place_meeting(x - 27, y, obj_wall)) and can_move) {
		key_presses++
	}
	if ((keyboard_check_pressed(ord("D")) and !place_meeting(x + 27, y, obj_wall)) and can_move) {
		key_presses++
	}
	
	//movement presses
	if (keyboard_check_pressed(ord("A")) and can_move = true){
		left_move = true
	}
	if (keyboard_check_pressed(ord("D")) and can_move = true){
		right_move = true
	}
	if (keyboard_check_pressed(ord("W")) and can_move = true){
		up_move = true
	}
	if (keyboard_check_pressed(ord("S")) and can_move = true){
		down_move = true
	}
	
	//stop system
	if (place_meeting(x + 27, y, obj_wall) and right_move = true){
		block_push = instance_position(x + 108, y, obj_wall);
		if (!can_move and (block_push != noone) = true){
			block_push.right_move = sex;
		} 
		right_move = false
	}
	if (place_meeting(x - 27, y, obj_wall) and left_move = true){
		block_push = instance_position(x - 108, y, obj_wall);
		if (!can_move and (block_push != noone) = true){
			block_push.left_move = sex;
		} 
		left_move = false
	}
	if (place_meeting(x, y - 27, obj_wall) and up_move = true){
		block_push = instance_position(x, y - 108, obj_wall);
		if (!can_move and (block_push != noone) = true){
			block_push.up_move = sex;
		} 
		up_move = false
	}
	if (place_meeting(x, y + 27, obj_wall) and down_move = true){
		block_push = instance_position(x, y + 108, obj_wall);
		if (!can_move and (block_push != noone) = true){
			block_push.down_move = sex;
		} 
		down_move = false
	}
	
	//more stop system
	if (left_move = true) {
		x -= 27;
	}
	if (right_move = true) {
		x += 27;
	}
	if (down_move = true) {
		y += 27;
	}
	if (up_move = true) {
		y -= 27;
	}
	
	if (keyboard_check_pressed(ord("R"))){
		room_restart()
	}
	
	if (can_move = true) {
		sex = 0;
	}

	can_move = true