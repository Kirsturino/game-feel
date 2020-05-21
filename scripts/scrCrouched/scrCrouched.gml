//Get input
scrInput();

//Movement
scrFallThrough();

scrJump();
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

//Animations
scrCrouchAnimation();

//State switches
scrToAir();
scrCrouchToGrounded();