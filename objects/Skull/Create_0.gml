event_inherited();
playingDamagedAnimation = false;

currentPathPointIndex = 0;
currentPathDestination = new Vector2();
currentPathRequest = -1;

TakeDamageBase = method(id, TakeDamage);

TakeDamage = function(damage, hitDirection)
{
	var impactVelocity = hitDirection;
	impactVelocity.MultiplyReal(10);
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