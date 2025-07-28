function PathRequest(_targetId, _followingObjectId, _pathId, _resetDistance, _pathUpdatedCallback) constructor
{
	initialized = false;
	followingObjectId = _followingObjectId;
	targetId = _targetId;
	resetDistanceSquared = _resetDistance * _resetDistance;
	targetPosition = new Vector2(_targetId.x, _targetId.y);
	targetLastPosition = GetPositionVector(_targetId);
	
	pathId = _pathId;
	pathUpdatedCallback = _pathUpdatedCallback;
	
	static Update = function(gridInitializer)
	{
		var distanceSquared = targetLastPosition.DistanceSquared(GetPositionVector(targetId));
		
		if (!instance_exists(followingObjectId))
		{
			return;
		}
		if (!instance_exists(targetId))
		{
			return;
		}
		
		if (distanceSquared > resetDistanceSquared || !initialized)
		{
			initialized = true;
			targetLastPosition = GetPositionVector(targetId);
			followerPosition = GetClosestReachablePoint(gridInitializer, GetPositionVector(followingObjectId));
			targetPosition = GetClosestReachablePoint(gridInitializer, GetPositionVector(targetId));
			mp_grid_path(gridInitializer.grid, pathId, followerPosition.x, followerPosition.y, targetPosition.x, targetPosition.y, true);
			pathUpdatedCallback();
		}
	}
	
	static GetClosestReachablePoint = function(gridInitializer, position)
	{
		var cellSize = gridInitializer.gridSize;
		var searchCellPosition = gridInitializer.GetCellFromPosition(position);
		var validCells = array_create(0);
		
		var targetRealPosition = GetPositionVector(targetId);
		var followerPosition = GetPositionVector(followingObjectId);
		
		if (gridInitializer.IsReachable(searchCellPosition))
		{
			// return gridInitializer.GetCellPosition(searchCellPosition.x, searchCellPosition.y);
			return position;
		}
		
		// Check all points around the target cell
		
		for (var i = 0; i < 8; ++i)
		{
			for (var cellX = -1; cellX <= 1; ++cellX)
			{
				for (var cellY = -1; cellY <= 1; ++cellY)
				{
					if (cellY == 0 && cellX == 0)
					{
						continue;
					}
				
					var cellPosition = variable_clone(searchCellPosition);
					cellPosition.x += cellX * i;
					cellPosition.y += cellY * i;
				
					if (gridInitializer.IsReachable(cellPosition))
					{
						var pathRequestScore = new PathRequestScore();
						pathRequestScore.targetPosition = gridInitializer.GetCellPosition(cellPosition.x, cellPosition.y);
						pathRequestScore.targetScore = targetRealPosition.DistanceSquared(pathRequestScore.targetPosition);
						pathRequestScore.followerScore = followerPosition.DistanceSquared(pathRequestScore.targetPosition);
						ArrayPushBack(validCells, pathRequestScore);
					}
				}
			}
			
			if (array_length(validCells) > 0)
			{
				break;
			}
		}
		
		if (array_length(validCells) <= 0)
		{
			return new Vector2();
		}
		
		array_sort(validCells, SortFunction);
		return validCells[0].targetPosition;
	}
	
	static SortFunction = function(pathRequestScoreA, pathRequestScoreB)
	{
		var scoreDifference = pathRequestScoreA.targetScore - pathRequestScoreB.targetScore;
		if (scoreDifference == 0)
		{
			return pathRequestScoreB.followerScore - pathRequestScoreA.followerScore;
		}
		
		return scoreDifference;
	}
}

function PathRequestScore() constructor
{
	targetPosition = new Vector2();
	targetScore = 0;
	followerScore = 0;
}