
if (array_contains(owner.hitObjects, other))
{
	return;
}

array_insert(owner.hitObjects, array_length(owner.hitObjects), other);
var hitVelocity = hitDirection;
hitVelocity.MultiplyReal(3);
other.TakeDamage(1, hitVelocity);