textLines = array_create(0);
displayedText = array_create(0);
padding = 2;

maxDisplayedLines = 2;
charDisplayTime = 0.1;

playing = false;
currentLine = 0;
currentCharIndex = 0;
currentCharTimer = 0;
currentDisplayLineIndex = 0;

/// @param {String} text
SetText = function(text)
{
	// Pre-process all of our text into separated lines already, to prevent end-of-line flashing
	textLines = WrapText(text, GetDisplayWidth());
	array_push(displayedText, "");
	playing = true;
	currentLine = 0;
	currentCharTimer = 0;
	displayedText = array_create(1, "");
	currentDisplayLineIndex = 0;
}

GetDisplayWidth = function()
{
	return image_xscale * 8 - padding;
}