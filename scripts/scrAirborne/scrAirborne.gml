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

//Room transition
scrTransition();

//Touch and reveal secrets
scrSecrets();

//Die
scrDanger();

//State switches
scrToGround();