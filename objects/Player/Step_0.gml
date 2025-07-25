if (!movementEnabled)
{
	return;
}

inputAxis = InputAxis2Keys(ord("D"), ord("A"), ord("W"), ord("S"));
inputAxis.MultiplyReal(40.0);
velocity.x = inputAxis.x; 
velocity.y = -inputAxis.y;
var newLookDirection = inputAxis.ToDirection();
if (newLookDirection != LookDirection.None)
{
	lookDirection = newLookDirection;
}

event_inherited();