//Get input
scrInput();

//Track specific variables only while airborne
scrAirborneStats();
scrNearGround();

//Jump stuff
scrJump();
scrWallJump();
scrWantsToJump();
scrJumpControl();

//Movement
scrCollisionMovement();
scrPushPull();
scrRestore();

//Squash and stretch
scrSquashAirborne();
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
scrAirborneAnimation();

//State switches
scrToGround();

//Die
scrDanger();