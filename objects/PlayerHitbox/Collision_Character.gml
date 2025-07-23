
if (array_contains(owner.hitObjects, other))
{
	return;
}

array_insert(owner.hitObjects, array_length(owner.hitObjects), other);
other.TakeDamage(1);
var hitVelocity = hitDirection;
hitVelocity.MultiplyReal(3);
other.x += hitVelocity.x;
other.y -= hitVelocity.y;