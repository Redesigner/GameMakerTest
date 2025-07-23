if (!movementEnabled)
{
	return;
}

inputAxis = InputAxis2Keys(ord("D"), ord("A"), ord("W"), ord("S"));
inputAxis.MultiplyReal(0.5);
move_and_collide(inputAxis.x, -inputAxis.y, layer_tilemap_get_id("Walls"));
var newLookDirection = inputAxis.ToDirection();
if (newLookDirection != LookDirection.None)
{
	lookDirection = newLookDirection;
}