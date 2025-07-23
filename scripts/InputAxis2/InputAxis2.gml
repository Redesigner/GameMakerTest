function InputAxis2Keys(right, left, up, down)
{
	var inputAxis = new Vector2(0, 0);
	if (keyboard_check(right))
	{
		inputAxis.x++;
	}
	
	if (keyboard_check(left))
	{
		inputAxis.x--;
	}
	
	if (keyboard_check(up))
	{
		inputAxis.y++;
	}
	
	if (keyboard_check(down))
	{
		inputAxis.y--;
	}
	
	inputAxis.Normalize();
	return inputAxis;
}