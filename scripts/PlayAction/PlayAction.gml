/// @param {Id.Instance} object
function PlayAction(object, sequenceId)
{
	object.activeAnimation = sequenceId;
	object.sequenceLayer = layer_create(object.depth);
	object.activeSequence = layer_sequence_create(object.sequenceLayer, object.x, object.y, sequenceId);
	var spawnedObjects = sequence_get_objects(object.activeAnimation);
	
	var hitbox = instance_create_layer(x, y, object.sequenceLayer, PlayerHitbox);
	hitbox.owner = object;
	hitbox.hitDirection = VectorFromDirection(object.lookDirection);
	sequence_instance_override_object(layer_sequence_get_instance(object.activeSequence), PlayerHitbox, hitbox);

	object.Disable();
}

/// @param {Id.Instance} object
function EndAction(object)
{
	layer_sequence_destroy(object.activeSequence);
	layer_destroy(object.sequenceLayer);
	object.activeAnimation = -1;
	object.sequenceLayer = -1;
	object.activeSequence = -1;
	
	object.Enable();
	array_delete(object.hitObjects, 0, array_length(object.hitObjects));
}