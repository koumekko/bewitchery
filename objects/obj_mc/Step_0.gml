 	if (left_move or right_move or up_move or down_move) {
		can_move = false;
		supersex += 0.25; //I think this is a variable test? smth like that, for debugging?
		sex += 0.25
	}
	
	// room switching and restartiung
	if (place_meeting(x, y, obj_finish) and key_presses > -1 and can_move) {
		room_goto_next()
	}
	if (key_presses < 0 and !place_meeting(x, y, obj_wall)) {
		instance_create_depth(x, y, -10, obj_restart)
	}
	
	
	//keypresses
	move_wrap(true, true, 0)
	if ((keyboard_check_pressed(ord("S")) and !place_meeting(x, y + 27, obj_wall)) and can_move) {
		key_presses--
		if (place_meeting(x, y, obj_stand)){
			block_do = instance_position(x, y, obj_stand)
			block_do.dothing ++;
		}
	}
	if ((keyboard_check_pressed(ord("W")) and !place_meeting(x, y - 27, obj_wall)) and can_move) {
		key_presses--
		if (place_meeting(x, y, obj_stand)){
			block_do = instance_position(x, y, obj_stand)
			block_do.dothing ++;
		}
	}
	if ((keyboard_check_pressed(ord("A")) and !place_meeting(x - 27, y, obj_wall)) and can_move) {
		key_presses--
		if (place_meeting(x, y, obj_stand)){
			block_do = instance_position(x, y, obj_stand)
			block_do.dothing ++;
		}
	}
	if ((keyboard_check_pressed(ord("D")) and !place_meeting(x + 27, y, obj_wall)) and can_move) {
		key_presses--
		if (place_meeting(x, y, obj_stand)){
			block_do = instance_position(x, y, obj_stand)
			block_do.dothing ++;
		}
	}
	
	//movement presses
	if (keyboard_check_pressed(ord("A")) and can_move = true){
		left_move = true;
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
	
	//buffer moves
	if (keyboard_check_pressed(ord("A")) and can_move = false){
		buffer_move = "left"
	}
	if (keyboard_check_pressed(ord("D")) and can_move = false){
		buffer_move = "right"
	}
	if (keyboard_check_pressed(ord("W")) and can_move = false){
		buffer_move = "up"
	}
	if (keyboard_check_pressed(ord("S")) and can_move = false){
		buffer_move = "down"
	}
	if ((buffer_move != "nothing") & (can_move=true)){
		if (buffer_move = "left") {
			buffer_move = "nothing";
			if (!(place_meeting(x - 27, y, obj_wall)) & (right_move = false)) {
				key_presses--;
			}
			left_move = true;
			if (place_meeting(x, y, obj_stand)){
				block_do = instance_position(x, y, obj_stand)
				block_do.dothing ++;
			}
		}
		if (buffer_move = "right") {
			buffer_move = "nothing";
			if (!(place_meeting(x + 27, y, obj_wall)) & (right_move = false)) {
				key_presses--;
			}
			right_move = true;
			if (place_meeting(x, y, obj_stand)){
				block_do = instance_position(x, y, obj_stand)
				block_do.dothing ++;
			}
		}
		if (buffer_move = "up") {
			buffer_move = "nothing";
			if (!(place_meeting(x, y - 27, obj_wall)) & (up_move = false)) {
				key_presses--;
			}
			up_move = true;
			if (place_meeting(x, y, obj_stand)){
				block_do = instance_position(x, y, obj_stand)
				block_do.dothing ++;
			}
		}
		if (buffer_move = "down") {
			buffer_move = "nothing";
			if (!(place_meeting(x, y + 27, obj_wall)) & (down_move = false)) {
				key_presses--;
			}
			down_move = true;
			if (place_meeting(x, y, obj_stand)){
				block_do = instance_position(x, y, obj_stand)
				block_do.dothing ++;
			}
		}
	}
	
	//spikes and stand stuff
	if (place_meeting(x, y, obj_stand) and (can_move = false) and !place_empty(x, y, obj_stand)){
		block_do = instance_nearest(x, y, obj_stand)
		if (block_do.x = x and block_do.y = y)
		{
			block_do.dothing ++;
		}
	}
	
	//stop system
	if (place_meeting(x + 27, y, obj_wall) and right_move = true){
		block_push = instance_position(x + 108, y, obj_wall);
		if (!can_move and (block_push != noone) = true){
			block_push.right_move = sex; //i did this sex thing as a joke but i literally don't know what it does xD
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
	
		//fix to bug where you could move two directions
	twomove = 0;
	if (left_move = true) {twomove++}
	if (right_move = true) {twomove++}
	if (up_move = true) {twomove++}
	if (down_move = true) {twomove++}
	if (twomove > 1) {
		left_move = 0
		right_move = 0
		up_move = 0
		down_move = 0
		key_presses += twomove
	}
	
	//movement system
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
	
	//room switching
	if (keyboard_check_pressed(ord("R"))){
		room_restart()
	}
	if (keyboard_check_pressed(ord("1"))){
		room_goto(level_one)
	}
	if (keyboard_check_pressed(ord("2"))){
		room_goto(level_two)
	}
	if (keyboard_check_pressed(ord("3"))){
		room_goto(level_three)
	}
	if (keyboard_check_pressed(ord("4"))){
		room_goto(level_four)
	}
	if (keyboard_check_pressed(ord("5"))){
		room_goto(level_five)
	}
	if (keyboard_check_pressed(ord("6"))){
		room_goto(level_six)
	}
	if (keyboard_check_pressed(ord("7"))){
		room_goto(level_seven)
	}
	if (keyboard_check_pressed(ord("8"))){
		room_goto(level_eight)
	}
	if (keyboard_check_pressed(ord("0"))){
		room_goto(level_test)
	}
	
	
	
	
	if (can_move = true) {
		sex = supersexysex;
	}
	
if !(left_move or right_move or up_move or down_move) {
	can_move = true
	supersexysex = 0
}

//smoothness
fake_x = fake_x + smoothness*(x-fake_x);
fake_y = fake_y + smoothness*(y-fake_y);