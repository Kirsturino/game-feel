parSurf = surface_create(room_width, room_height);

//Generate a static background
scrBackground();

//Generate grass on top of collision objects
with (oCollision)
{
	scrGenerateGrass();
}