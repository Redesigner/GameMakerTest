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
