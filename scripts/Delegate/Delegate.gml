/// @param {Struct|Id.Instance} _caller
function DelegateMember(_caller, _method) constructor
{
	caller = weak_ref_create(_caller);
	storedMethod = _method;
}


function Delegate() constructor
{
	boundCallers = array_create(0);
	
	/// Invoke the bound functions, cleaning up expired references when necessary
	static Invoke = function()
	{
		// Clean up objects that have expired
		ArrayEraseIf(boundCallers, function(caller)
			{
				return !weak_ref_alive(caller.caller);
			}
		);
		
		array_foreach(boundCallers, function(caller)
			{
				caller.storedMethod();
			}
		);
	}
	
	/// @param {Struct|Id.Instance} _caller
	static Register = function(_caller, _method)
	{
		ArrayPushBack(boundCallers, new DelegateMember(_caller, _method));
	}
}