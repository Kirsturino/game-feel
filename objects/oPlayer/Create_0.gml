//Initialize default state
state = scrAirborne;

//Initialize movement variables
hsp = 0;
vsp = 0;
hspFraction = 0;
drag = 0.5;
airDrag = 0.15;
airdragMax = 0.15;
crouchDrag = 0.5;
axl = 0.65;
airAxl = 0.5;
airAxlMax = 0.6;
crouchAxl = 0.6;
hspMaxNormal = 2;
vspMaxNormal = 4;
hspMax = 2;
vspMax = 4;
hspMaxCrouched = 1.5;
jumpSpeed = 3.75;
crouchJumpSpeed = 5;
newestDir = "";
move = 0;
ledgeTimer = 0;
ledgeTimerMax = 15;

//Push & Pull variables
ppSpeed = 0;
ppSpeedMax = 5;
ppAxl = 1;
ppFramesMax = 5;
ppFrames = ppFramesMax;
airAxlChangeSpeed = 0.015;
airDragChangeSpeed = 0.1;
spChangeSpeed = 0.075;
ppDir = 0;
isPush = false;
isPull = false;
hspMaxPP = 5;
vspMaxPP = 5;
interact = noone;
lastInteract = noone;

//Walljump variables
wallJumpDistance = 5;
wallJumpDir = "";
hspMaxWallJump = hspMaxNormal;
wallJumpHSpeed = hspMaxWallJump;
wallJumpVMultiplier = 0.9;
wallJumpTimerMax = 12;
wallJumpTimer = wallJumpTimerMax;
wallJumping = false;
fallSpeedWall = 1;
#macro wallJumpCoyoteBufferLength 5
huggedWall = false;
canWallJump = false;

//Jump controls
grvModifier = 0.7;
defaultFallSpeed = 4;
fallspeedHeld = 3.5;
fastFallSpeed = 5;
curFallSpeed = 4;
fallSpeedChangeSpeed = 0.25;

//Jump buffer
wantsToJump = false;
#macro jumpBufferLength 8
wasGrounded = false;
#macro coyoteBufferLength 5

//Squash and stretch variables
squashSpeed = 0.15;
xScaleTarget = 1;
yScaleTarget = 1;
xDrawScale = 1;
yDrawScale = 1;

//Character graphics
curSprite = sPlayer;
spriteRot = 0;
spriteAlpha = 1;
lightRadius = 64;
lightRadiusMax = 72;
lightRadiusMin = 48;
color = global.cWhite;
colorTo = global.cWhite;
canDashColor = global.cWhite;
cantDashColor = global.cGray;

//Track stats
lastVsp = 0;
xCollision = false;
yCollision = true;
nearGround = 0;

//Collision forgiveness
minLedgeDifferenceX = 8;
minLedgeDifferenceY = 8;
ledgeGrabSpeed = 4;
ledgeGrabSpeedHeld = 3;
ledgeGrabSpeedNormal = 4.5;
ledgeGrabLength = 16;

//SFX variables
refreshPitch = 1;

defaultX = x;
defaultY = y;
scrSpawn();

//Keep player moving after screen transitions
scrInput();
if (right) newestDir = "right";
if (left) newestDir = "left";

//Controller & Input stuff
gamepad_set_axis_deadzone(global.controller, 0.1);