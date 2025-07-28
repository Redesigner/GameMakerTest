event_inherited();

if (global.paused)
{
	return;
}

switch (lookDirection)
{
	case LookDirection.Down:
		sprite_index = Sp_PlayerDown;
	break;
	case LookDirection.Up:
		sprite_index = Sp_PlayerUp;
	break;
	case LookDirection.Right:
		sprite_index = Sp_PlayerRight;
	break;
	case LookDirection.Left:
		sprite_index = Sp_PlayerLeft;
	break;
}

image_speed = inputAxis.LengthSquared() > 0.0 ? 1.0 : 0.0;