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
scrUnlockReset();
scrActivateSmoke();

//Animations
scrGroundedAnimation();

//State switches
scrToAir();
scrToCrouch();

//Death
scrDanger();