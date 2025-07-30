enum LookDirection
{
	None,
	Up,
	Down,
	Left,
	Right
}

function Vector2(_x = 0, _y = 0) constructor
{
	x = _x;
	y = _y;
	
	static Add = function(_vec2)
	{
		x += _vec2.x;
		y += _vec2.y;
	}
	
	static Subtract = function(_vec2)
	{
		x -= _vec2.x;
		y -= _vec2.y;
	}
	
	/// @param {Struct.Vector2} value
	static Multiply = function(_vec2)
	{
		x *= _vec2.x;
		y *= _vec2.y;
	}
	
	/// @param {Real} value
	static MultiplyReal = function(value)
	{
		x *= value;
		y *= value;
	}
	
	/// @param {Struct.Vector2} value
	/// @return {Struct.Vector2}
	static Times = function(_vec2)
	{
		return new Vector2(x * _vec2.x, y * _vec2.y);
	}
	
	static TimesReal = function(value)
	{
		return new Vector2(x * value, y * value);
	}
	
	static Divide = function(_vec2)
	{
		x /= _vec2.x;
		y /= _vec2.y;
	}
	
	static Dot = function(_vec2)
	{
		return x * _vec2.x + y * _vec2.y;
	}
	
	static LengthSquared = function()
	{
		return x * x + y * y;
	}
	
	static Length = function()
	{
		return sqrt(LengthSquared());
	}
	
	static DistanceSquared = function(_vec2)
	{
		var xDelta = _vec2.x - x;
		var yDelta = _vec2.y - y;
		return xDelta * xDelta + yDelta * yDelta;
	}
	
	static Normalize = function()
	{
		var length = Length();
		if (length == 0.0)
		{
			x = 0.0;
			y = 0.0;
			return;
		}
		x /= length;
		y /= length;
	}
	
	static IsZero = function()
	{
		return x == 0.0 && y == 0.0;
	}
	
	static ToDirection = function()
	{
		if (IsZero())
		{
			return LookDirection.None;
		}
		
		if (abs(y) > abs(x))
		{
			return y > 0.0 ? LookDirection.Up : LookDirection.Down;
		}
		else
		{
			return x > 0.0 ? LookDirection.Right : LookDirection.Left;
		}
	}
}

function VectorFromDirection(direction)
{
	switch(direction)
	{
		case LookDirection.Down:
			return new Vector2(0, 1);
		case LookDirection.Left:
			return new Vector2(-1, 0);
		case LookDirection.Right:
			return new Vector2(1, 0);
		case LookDirection.Up:
			return new Vector2(0, -1);
		default:
			return new Vector2(0, 0);
	}
}

function GetPositionVector(objectId)
{
	return new Vector2(objectId.x, objectId.y);
}