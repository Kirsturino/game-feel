//Get input
scrInput();

//Movement
scrJump();
scrCollisionMovement();
scrPushPull();
scrResetPP();

//Room transition
scrTransition();

//Squash and stretch
scrSquashGrounded();
scrSquash();

//State switches
scrToAir();
scrToCrouch();