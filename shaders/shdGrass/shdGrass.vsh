// Passthrough vertex shader

attribute vec3 in_Position;                  // (x,y,z)
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute float in_Weight;

varying vec4 v_vColour;

//Time in frames
uniform float uTime;

//Player coordinates
uniform float playerX;
uniform float playerY;

//Check if player near ground
uniform float playerGround;

//Another sin wave to randomize wind intensity
uniform float rng;

//Direction the wind should blow, -1 for left, 1 for right
uniform float dir;

void main()
{
	vec4 transformPosition = vec4(in_Position.xyz, 1.0);
	
	//Max distance that player can be to interact with grass
	float maxPlayerDistance = 16.;
	float maxPlayerHeight = 24.;
	float player = in_Position.x - playerX;
	float playerHeight = in_Position.y - playerY;
	
	//Calculate grass swaying in the wind
	//inPosition.x is for wind traveling in waves
	float wind = (dir + sin(uTime + in_Position.x / 12.) / 2.) * rng;
	
	if (abs(player) < maxPlayerDistance && abs(playerHeight) < maxPlayerHeight && playerGround == 1.)
	{
		float xx = maxPlayerDistance - player;
		float displace = sign(dir) * (maxPlayerDistance / 2. + sin((xx / maxPlayerDistance) * 3.14) * 4.);

		wind *= .1;
		transformPosition.x += smoothstep(0., 1., in_Weight * .5) * displace + smoothstep(0., 1., in_Weight * .5) * wind * sign(player);
	} else
	{

		transformPosition.x += smoothstep(0., 1., in_Weight * .5) * wind;
	}
	
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * transformPosition;
    
    v_vColour = in_Colour;
}