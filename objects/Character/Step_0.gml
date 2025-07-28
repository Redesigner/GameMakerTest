if (global.paused)
{
	return;
}

var delta = variable_clone(velocity);
if (!delta.IsZero())
{
	// Clamp time so we don't have tunneling issues
	var timeSeconds = min(delta_time / 1000000, 0.5);
	delta.MultiplyReal(timeSeconds);
	Move(delta);
}