//Init all rooms
global.roomList = ds_list_create();

//Init all collectibles
global.collectibleList = ds_list_create();

//This gets overwritten by save loading immediately
global.roomTo = rmTest;