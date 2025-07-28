spawnedObjectCount = 0;
timerTicking = true;
currentTime = 0;

ObjectDestroyed = function()
{
	--spawnedObjectCount;
	
	timerTicking = true;
}

SpawnObject = function()
{
	if (spawnedObjectCount == maxObjectCount)
	{
		return;
	}
	var newObject = instance_create_layer(x, y, layer, objectToSpawn);
	newObject.onDeath.Register(id, ObjectDestroyed);
	newObject.StartPathing();
	++spawnedObjectCount;
}

timerTicking = true;