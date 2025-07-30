startingDialog = new Dialog();
startingDialog.text =
	"Rumors are spreading which suggest the moon is falling, but you can breathe easier as long as I am in town.\nTonight, I shall cut the moon into pieces!";

Interact = function(instance)
{
	instance.ShowDialog(startingDialog);
}