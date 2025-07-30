draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, direction, c_white, 1.0);

draw_set_font(Ft_Monogram)

var numLines = array_length(displayedText);
for (var i = currentDisplayLineIndex; i < numLines; ++i)
{
	draw_text(x + padding, y + (i - currentDisplayLineIndex) * 10, displayedText[i]);
}