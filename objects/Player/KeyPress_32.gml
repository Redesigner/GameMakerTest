if (!movementEnabled || global.paused)
{
	return;
}

switch(lookDirection)
{
	case LookDirection.Right:
		PlayAction(id, Sq_PlayerAttackRight);
	break;
	case LookDirection.Left:
		PlayAction(id, Sq_PlayerAttackLeft)
	break;
}