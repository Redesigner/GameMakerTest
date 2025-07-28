// This is an object for handling persistent data, and listening for global events
// It should always be created in the first room and should only have one instance


// Store a reference to self in global table, just for faster access
global.gameState = id;
global.paused = false;

onPaused = new Delegate();
onUnpaused = new Delegate();