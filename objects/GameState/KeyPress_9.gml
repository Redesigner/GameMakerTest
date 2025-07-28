global.paused = !global.paused;

if (global.paused)
{
	onPaused.Invoke();
}
else
{
	onUnpaused.Invoke();
}