//Get input
scrInput();

//Movement
scrJump();
//scrCrouchJump();
scrCollisionMovement();
scrPushPull();

//Squash and stretch
scrSquashCrouched();
scrSquash();

//Room transition
scrTransition();

//State switches
scrToAir();
scrCrouchToGrounded();