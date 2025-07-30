function ArrayPushBack(arrayId, value)
{
	array_insert(arrayId, array_length(arrayId), value);
}

function ArrayEraseIf(arrayId, evaluator)
{
	var erasedCount = 0;
	for (var i = array_length(arrayId) - 1; i >= 0; --i)
	{
		if (evaluator(arrayId[i]))
		{
			array_delete(arrayId, i, 1);
			++erasedCount;
		}
	}
	return erasedCount;
}

function ArrayPopBack(arrayId)
{
	var index = array_length(array) - 1;
	var popped = array_get(arrayId, index);
	array_erase(arrayId, index);
	return popped;
}