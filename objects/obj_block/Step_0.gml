// Legacy Code
if (right_move > 0) {
	if (!place_meeting(x + 54, y, obj_wall)) {
		x += 108
	}
	right_move--
}
if (left_move > 0) {
	if (!place_meeting(x - 108, y, obj_wall)) {
		x -= 108
	}
	left_move--
}
if (up_move > 0) {
	if (!place_meeting(x, y -108, obj_wall)) {
		y -= 108
	}
	up_move--
}
if (down_move > 0) {
	if (!place_meeting(x, y + 54, obj_wall)) {
		y += 108
	}
	down_move--
}
/*
for (; (!place_meeting(x + 54, y, obj_wall)) & (right_move > 0); x += 108) {
	right_move--
}
for (; (!place_meeting(x - 54, y, obj_wall)) & (left_move > 0); x -= 108) {
	left_move--
}
for (; (!place_meeting(x, y - 54, obj_wall)) & (up_move > 0); y -= 108) {
	up_move--
}
for (; (!place_meeting(x, y + 54, obj_wall)) & (down_move > 0); y += 108) {
	down_move--
}*/



//fake animation
fake_x = fake_x + 0.2*(x-fake_x);
fake_y = fake_y + 0.2*(y-fake_y);