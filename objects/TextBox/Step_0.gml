if (!playing)
{
	return;
}

currentCharTimer += delta_time / 1000000;

if (currentCharTimer >= charDisplayTime)
{
	currentCharTimer -= charDisplayTime;
	displayedText[currentLine] += string_char_at(textLines[currentLine], currentCharIndex + 1);
	++currentCharIndex;
	
	if (currentCharIndex > string_length(textLines[currentLine]))
	{
		++currentLine;
		currentCharIndex = 0;
		if (currentLine >= array_length(textLines))
		{
			playing = false;
		}
		else
		{
			if (currentLine >= maxDisplayedLines)
			{
				++currentDisplayLineIndex;
			}
			array_push(displayedText, "");
		}
	}
}