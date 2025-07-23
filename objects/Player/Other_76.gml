if (event_data[? "event_type"] == "sequence event")
{
	if (event_data[? "element_id"] != activeSequence)
	{
		return;
	}
	
	switch (event_data[? "message"])
	{
		case "action_end":
			EndAction(id);
		break;
	}
}