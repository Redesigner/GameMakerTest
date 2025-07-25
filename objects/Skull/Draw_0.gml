draw_sprite(sprite_index, image_index, x, y);

if (global.drawDebug)
{
	draw_set_color(c_blue);
	draw_arrow(x, y, currentPathDestination.x, currentPathDestination.y, 2.0);
	draw_circle(currentPathDestination.x, currentPathDestination.y, 1.0, false);
	draw_text_transformed(x, y - 20, currentPathPointIndex, 0.2, 0.2, 0);
	draw_set_color(c_green);
	
	draw_arrow(x, y, x + velocity.x / 5.0, y + velocity.y / 5.0, 2.0);
	draw_set_color(c_white);
}