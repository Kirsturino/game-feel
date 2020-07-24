//Initialize default state
state = scrAirborne;

//Random variables
blockMovement = false;

//Initialize input variables
left = false;
right = false;
down = false;
leftPress = false;
rightPress = false;
leftRelease = false;
rightRelease = false;
jump = false;
jumpHeld = false;
pushPress = false;
pullPress = false;
freeCamToggle = false;
restartPress = false;
joyActive = false;
releaseJoyDir = 0;
	
//Initialize movement variables
hsp = 0;
vsp = 0;
hspFraction = 0;
drag = 0.5;
airDrag = 0.15;
airdragMax = 0.15;
crouchDrag = 0.1;
axl = 0.8;
airAxl = 0.5;
airAxlMax = 0.6;
crouchAxl = 0.6;
hspMaxNormal = 2;
vspMaxNormal = 4;
hspMax = 2;
vspMax = 4;
hspMaxCrouched = 1.5;
jumpSpeed = 3.75;
longJumpSpeed = jumpSpeed * 0.7;
newestDir = "";
move = 0;
ledgeTimer = 0;
ledgeTimerMax = 20;

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
wantsToPull = false;
wantsToPush = false;
#macro ppBufferLength 8

//Walljump variables
wallJumpDistance = 3;
wallJumpDir = "";
hspMaxWallJump = hspMaxNormal;
wallJumpHSpeed = hspMaxWallJump;
wallJumpVMultiplier = 0.9;
wallJumpTimerMax = 13;
wallJumpTimer = wallJumpTimerMax;
wallJumping = false;
fallSpeedWall = 0.6;
#macro wallJumpCoyoteBufferLength 5
huggedWall = false;
canWallJump = false;
hugRight = false;
hugLeft = false;
wallJumpCancelAmount = 2;

//Jump controls
grvModifier = 0.7;
defaultFallSpeed = 3.2;
fallspeedHeld = 3;
fastFallSpeed = 4;
curFallSpeed = defaultFallSpeed;
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
curSprite = sPlayerIdleRight;
spriteRot = 0;
spriteAlpha = 1;
color = global.cWhite;
colorTo = global.cWhite;
canDashColor = global.cWhite;
cantDashColor = global.cOrange;
dashFXLength = ppFramesMax * 5;
animationFrame = 0;
animationFrameIncrement = 0;
animationSpeed = 2;

//Outline shader stuff
upixelH = shader_get_uniform(shdOutline, "pixelH");
upixelW = shader_get_uniform(shdOutline, "pixelW");
texelW = texture_get_texel_width(sprite_get_texture(curSprite, 0));
texelH = texture_get_texel_height(sprite_get_texture(curSprite, 0));

//Track stats
lastVsp = 0;
xCollision = false;
yCollision = true;
nearGround = 0;
behindWall = false;

//Collision forgiveness
minLedgeDifferenceX = 6;
minLedgeDifferenceY = 6;
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
if (!global.pause)
{
	scrInput();
	if (right) newestDir = "right";
	if (left) newestDir = "left";
}

//Spawn familiar
with (instance_create_layer(x, y, "Player", oFamiliar)) {followTarget = other; shouldWiggle = true;}

//Controller & Input stuff
gamepad_set_axis_deadzone(global.controller, 0.1);

//Secret variables
followingCollectible = noone;

//Interacting variables
interactDistance = 16;
lastSign = noone;