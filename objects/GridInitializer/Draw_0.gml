if (global.drawDebug)
{
	draw_set_alpha(0.15);
	mp_grid_draw(grid);
	draw_set_alpha(1);
	draw_set_color(c_blue);
	array_foreach(pathRequests, function(request, index)
	{
		if (!weak_ref_alive(request))
		{
			return;
		}
		draw_path(request.ref.pathId, 0, 0, true);
	});
	draw_text_transformed(10, 10, string_concat("Active requests: ", array_length(pathRequests)), .2, .2, 0);
	draw_set_color(c_white);
}