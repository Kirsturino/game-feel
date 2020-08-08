///@description lerp
///@param from
///@param to
///@param amount

var from = argument0;
var to = argument1;
var amount = argument2;

var result = (1 - amount) * from + amount * to;

return result;