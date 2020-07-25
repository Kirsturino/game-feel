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

//Touch triggers
scrTransition();
scrSecrets();
scrCheckpoint();
scrInteractables();
scrUnlockFreeCam();

//Animations
scrGroundedAnimation();

//State switches
scrToAir();
scrToCrouch();

//Death
scrDanger();