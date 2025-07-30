function WrapText(text, width)
{
	var textLines = array_create(0);
	
	text = string_replace_all(text, "\n", " \n ");
	var textWords = string_split(text, " ");
	var numWords = array_length(textWords);
	
	var currentLine = "";
	var lineCursorIndex = 0;
	
	for (var i = 0; i < numWords; ++i)
	{
		if (textWords[i] == "\n")
		{
			ArrayPushBack(textLines, currentLine);
			currentLine = "";
			continue;
		}
		
		var expectedLine = currentLine;
		if (string_length(expectedLine) > 0)
		{
			expectedLine += " ";
		}
		
		expectedLine += textWords[i];
		
		if (string_width(expectedLine) > width)
		{
			ArrayPushBack(textLines, currentLine);
			currentLine = "";
			--i;
			continue;
		}
		
		currentLine = expectedLine;
	}
	
	// Add the last line
	if (string_length(currentLine) > 0)
	{
		ArrayPushBack(textLines, currentLine);
	}
	return textLines;
}