//Get input
scrInput();

//Movement
scrJump();
scrCollisionMovement();
scrPushPull();
scrResetPP();

//Squash and stretch
scrSquashGrounded();
scrSquash();

//Room transition
scrTransition();

//Touch and reveal secrets
scrSecrets();

//Die
scrDanger();

//State switches
scrToAir();
scrToCrouch();