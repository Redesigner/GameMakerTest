event_inherited();
playingDamagedAnimation = false;

currentPathPointIndex = 0;
currentPathDestination = new Vector2();
currentPathRequest = -1;

moveSpeed = 20;

TakeDamageBase = method(id, TakeDamage);

TakeDamage = function(damage, hitDirection)
{
	var impactVelocity = variable_clone(hitDirection);
	impactVelocity.MultiplyReal(40);
	velocity = impactVelocity;
	PlayAnimationOnce(Sp_SkullDamaged);
	TakeDamageBase(damage, hitDirection);
	
	audio_play_sound(Fx_SkullHit, 1, false);
	movementEnabled = false;
	
	var resume = function()
	{
		velocity = new Vector2();
		movementEnabled = true;
	}
	call_later(0.25, time_source_units_seconds, resume, false);
}

StartPathing = function()
{
	var pathUpdatedCallback = function()
	{
		currentPathPointIndex = 0;
	}

	currentPathRequest = global.gridInitializer.MakePathRequest(instance_find(Player, 0), id, pathUpdatedCallback);
}