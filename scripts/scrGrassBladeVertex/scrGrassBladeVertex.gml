///@param vbuff
///@param x
///@param y
///@param width
///@param height
///@param segments

var vbuff = argument0;
var xx = argument1;
var yy = argument2;
var width = argument3;
var height = argument4;
var segments = argument5;

var segmentHeight = height / segments;

for (var i = 0; i < segments; i++)
{
	//Make grass shape, lerp for triangle
    var baseWidth = lerp(width, 1, i / segments);
	var topWidth = lerp(width, 1, (i + 1) / segments);
	
	//Make grass color, lerp for gradient
	var alpha = 1;
	var color = grassColor;

	
	//Get vertex coordinates
	var x1 = xx + (width - baseWidth) / 2;
	var y1 = yy - i * segmentHeight;
	var x2 = x1 + baseWidth;
	var y2 = y1;
	var x3 = xx + (width - topWidth) / 2;
	var y3 = y1 - segmentHeight;
	var x4 = x3 + topWidth;
	var y4 = y3;
	
	//Add weights
	var baseWeight = i / segments;
	var topWeight = (i + 1) / segments;
	
	//First triangle
	vertex_position(vbuff, x1, y1);
	vertex_color(vbuff, color, alpha);
	vertex_float1(vbuff, baseWeight);
	vertex_position(vbuff, x2, y2);
	vertex_color(vbuff, color, alpha);
	vertex_float1(vbuff, baseWeight);
	vertex_position(vbuff, x3, y3);
	vertex_color(vbuff, color, alpha);
	vertex_float1(vbuff, topWeight);
	
	//Second triangle
	vertex_position(vbuff, x2, y2);
	vertex_color(vbuff, color, alpha);
	vertex_float1(vbuff, baseWeight);
	vertex_position(vbuff, x4, y4);
	vertex_color(vbuff, color, alpha);
	vertex_float1(vbuff, topWeight);
	vertex_position(vbuff, x3, y3);
	vertex_color(vbuff, color, alpha);
	vertex_float1(vbuff, topWeight);
}