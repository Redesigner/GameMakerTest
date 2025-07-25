var pathUpdatedCallback = function()
{
	currentPathPointIndex = 0;
}

currentPathRequest = global.gridInitializer.MakePathRequest(instance_find(Player, 0), id, pathUpdatedCallback);