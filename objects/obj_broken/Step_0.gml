// Death
image_alpha = image_alpha * 0.8;
image_angle += 2 * spindirection;
x++;
y--;
if (image_alpha < 0.1) {
	instance_destroy();
}