if (global.paused)
{
	return;
}

if (!timerTicking)
{
	return;
}

currentTime += delta_time / 1000000;
if (currentTime > delay)
{
	SpawnObject();
	currentTime = 0;
	if (spawnedObjectCount >= maxObjectCount)
	{
		timerTicking = false;
	}
}