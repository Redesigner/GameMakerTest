event_inherited();

if (!movementEnabled || dead)
{
	return;
}

if (currentPathRequest == -1)
{
	return;
}

currentPathDestination.x = path_get_point_x(currentPathRequest.pathId, currentPathPointIndex);
currentPathDestination.y = path_get_point_y(currentPathRequest.pathId, currentPathPointIndex);

var currentPosition = new Vector2(x, y);
currentPosition.Subtract(currentPathDestination);

var pathLength = path_get_number(currentPathRequest.pathId);
while (currentPosition.LengthSquared() <= 4)
{
	if (currentPathPointIndex >= pathLength - 1)
	{
		velocity.x = 0;
		velocity.y = 0;
		return;
	}
	currentPathPointIndex++;
	currentPathDestination.x = path_get_point_x(currentPathRequest.pathId, currentPathPointIndex);
	currentPathDestination.y = path_get_point_y(currentPathRequest.pathId, currentPathPointIndex);
	currentPosition = GetPositionVector(id);
	currentPosition.Subtract(currentPathDestination);
}

currentPosition.Normalize();
currentPosition.MultiplyReal(-moveSpeed);
velocity = currentPosition;
//mp_potential_step(currentPathDestination.x, currentPathDestination.y, 0.5, false);