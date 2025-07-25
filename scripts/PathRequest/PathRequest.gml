function PathRequest(_targetId, _followingObjectId, _pathId, _resetDistance, _pathUpdatedCallback) constructor
{
	followingObjectId = _followingObjectId;
	targetId = _targetId;
	resetDistanceSquared = _resetDistance * _resetDistance;
	targetPosition = new Vector2(_targetId.x, _targetId.y);
	pathId = _pathId;
	pathUpdatedCallback = _pathUpdatedCallback;
	
	static Update = function(gridInitializer)
	{
		var distanceSquared = targetPosition.DistanceSquared(GetPositionVector(targetId));
		
		if (!instance_exists(followingObjectId))
		{
			// show_error("Following object missing!", false);
			return;
		}
		if (!instance_exists(targetId))
		{
			// show_error("Target missing!", false);
			return;
		}
		
		if (distanceSquared > resetDistanceSquared)
		{
			mp_grid_path(gridInitializer.grid, pathId, followingObjectId.x, followingObjectId.y, targetId.x, targetId.y, true);
			targetPosition = GetPositionVector(targetId);
			pathUpdatedCallback();
		}
	}
	
	static GetClosestReachablePoint = function(gridInitializer)
	{
		var cellSize = gridInitializer.gridSize;
		
		var validPoints = array_create(0);
		
		var targetRealPosition = GetPositionVector(targetId);
		var followerPosition = GetPositionVector(followingObjectId);
		
		// Check all points around the target cell
		for (var cellX = -1; cellX <= 1; ++cellX)
		{
			for (var cellY = -1; cellY <= 1; ++cellY)
			{
				if (cellY == 0 && cellX == 0)
				{
					continue;
				}
				
				if (mp_grid_get_cell(gridInitializer, cellX, cellY) == 0)
				{
					var pathRequestScore = new PathRequestScore();
					pathRequestScore.targetPosition = gridInitializer.GetCellPosition(cellX, cellY);
					pathRequestScore.targetScore = targetRealPosition.DistanceSquared(pathRequestScore.targetPosition);
					pathRequestScore.followerScore = followerScore.DistanceSquared(pathRequestScore.targetPosition);
					array_insert(validPoints, array_length(validPoints), pathRequestScore);
				}
			}
		}
	}
}

function PathRequestScore() constructor
{
	targetPosition = new Vector2();
	targetScore = 0;
	followerScore = 0;
}