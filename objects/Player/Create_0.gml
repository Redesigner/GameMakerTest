event_inherited();

Interact = function()
{
	var hitboxOffset = VectorFromDirection(lookDirection).TimesReal(16);
	hitboxOffset.Add(GetPositionVector(id));
	var result = collision_rectangle(hitboxOffset.x - 4, hitboxOffset.y - 4, hitboxOffset.x + 4, hitboxOffset.y + 4, NPC, false, true);
	if (result == noone)
	{
		return;
	}
	
	result.Interact(id);
}

/// @param {Struct.Dialog} dialog
ShowDialog = function(dialog)
{
	global.gameState.Pause();
	DialogBox.SetText(dialog.text);
}