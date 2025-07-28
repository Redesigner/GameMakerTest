gridSize = 8;
agentRadius = 7;
cellsHorizontal = room_width / gridSize - 1;
cellsVeritcal = room_height / gridSize - 1;
pathRequests = array_create(0);

// offset the grid by half our size, so we can travel down the middle of a room tile (right now these are 16x16)
grid = mp_grid_create(gridSize / 2, gridSize / 2, cellsHorizontal, cellsVeritcal, gridSize, gridSize);

global.gridInitializer = self;
global.drawDebug = false;
global.upscale = true;

GetCellPosition = function(cellX, cellY)
{
	return new Vector2((cellX + 1) * gridSize, (cellY + 1) * gridSize);
}

GetCellFromPosition = function(position)
{
	return new Vector2(
		round((position.x / gridSize) - 1), 
		round((position.y / gridSize) - 1)
	);
}

// Initialize grid
var tilemapLayer = layer_tilemap_get_id("Walls");
for (var cellX = 0; cellX < cellsHorizontal; ++cellX)
{
	for (var cellY = 0; cellY < cellsVeritcal; ++cellY)
	{
		var tileCheckSize = 4;
		var cellPosition = new Vector2(cellX, cellY);
		cellPosition.x += 1;
		cellPosition.y += 1;
		cellPosition.MultiplyReal(gridSize);
		if (collision_circle(cellPosition.x, cellPosition.y, agentRadius, tilemapLayer, false, false))
		{
			mp_grid_add_cell(grid, cellX, cellY);
		}
	}
}

IsReachable = function(position)
{
	return mp_grid_get_cell(grid, position.x, position.y) == 0;
}

MakePathRequest = function(targetId, followerId, callback)
{
	var path = path_add();
	var newPathRequest = new PathRequest(targetId, followerId, path, 4, callback);
	ArrayPushBack(pathRequests, weak_ref_create(newPathRequest));
	return newPathRequest;
}

var UpdatePath = function()
{
	var evaluator = function(weakRef)
	{
		var result = !weak_ref_alive(weakRef);
		return result;
	};
	
	var erasedCount = ArrayEraseIf(pathRequests, evaluator);
	if (erasedCount > 0)
	{
		show_debug_message("Erased {0} pathRequests this update", erasedCount);
	}
	
	
	var updateFunction = function(pathRequest, index)
		{
			pathRequest.ref.Update(self);
		};
		
	array_foreach(pathRequests, updateFunction);
}


call_later(0.16, time_source_units_seconds, UpdatePath, true);