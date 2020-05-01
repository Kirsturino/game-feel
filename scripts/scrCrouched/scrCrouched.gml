//Get input
scrInput();

//Movement
scrFallThrough();

//scrCrouchJump();
scrCollisionMovement();
scrPushPull();

//Squash and stretch
scrSquashCrouched();
scrSquash();

//Room transition
scrTransition();

//Touch and reveal secrets
scrSecrets();

//Die
scrDanger();

//State switches
scrToAir();
scrCrouchToGrounded();