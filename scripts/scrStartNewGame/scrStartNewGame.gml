if (file_exists("save.sav"))
{
	file_delete("save.sav");
}

scrClearSaveLists();

room_goto(rmSurfaceOne);