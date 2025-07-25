lookDirection = LookDirection.Down;
inputAxis = new Vector2(0, 0);
activeSequence = -1;
sequenceLayer = -1;
movementEnabled = true;
hitObjects = array_create(0);

velocity = new Vector2(0, 0);

previousAnimation = -1;

deathAnimation = -1;

hitPoints = 3;
dead = false;

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

TakeDamage = function(damage, hitDirection)
{
	if (damage <= 0)
	{
		return;
	}
	
	if (hitPoints <= 0)
	{
		return;
	}
	
	hitPoints -= damage;
	show_debug_message("{0} took damage! {1} health remaining", id, hitPoints);
	
	if (hitPoints <= 0)
	{
		hitPoints = 0;
		Die();
	}
}

Die = function()
{
	movementEnabled = false;
	dead = true;
	
	var destroySelf = function()
	{
		instance_destroy(id);
	}
	call_later(0.5, time_source_units_seconds,  destroySelf);
}

PlayAnimationOnce = function(animation)
{
	previousAnimation = sprite_index;
	sprite_index = animation;
}

Move = function(delta)
{
	move_and_collide(delta.x, delta.y, layer_tilemap_get_id("Walls"));
}