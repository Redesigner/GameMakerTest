event_inherited();
playingDamagedAnimation = false;

TakeDamage = function(damage)
{
	show_debug_message("took damage!");
	playingDamagedAnimation = true;
}