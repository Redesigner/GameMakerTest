lookDirection = LookDirection.Down;
inputAxis = new Vector2(0, 0);
activeSequence = -1;
sequenceLayer = -1;
movementEnabled = true;
hitObjects = array_create(0);

health = 3;

Disable = function()
{
	movementEnabled = false;
	image_alpha = 0;
}

Enable = function()
{
	movementEnabled = true;
	image_alpha = 1;
}

TakeDamage = function(damage)
{
	if (damage <= 0)
	{
		return;
	}
	
	if (health <= 0)
	{
		return;
	}
	
	health -= damage;
	
	if (health <= 0)
	{
		health = 0;
		Die();
	}
}

Die = function()
{
	movementEnabled = false;
}