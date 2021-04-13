/// @description Insert description here
// You can write your code in this editor
if (keyboard_check (vk_left)){
	if (x > sprite_get_xoffset (sprite_index) + spd){
		x -= spd;
	}
	else
		x = sprite_get_xoffset (sprite_index);
}
if (keyboard_check (vk_right)){
	if (x < room_width - sprite_get_xoffset (sprite_index) - spd){
		x += spd;
	}
	else
		x = room_width - sprite_get_xoffset (sprite_index);
}
//let the bat stay in the room
with (obj_ball){
	if (!go)
		x = other.x;
}
//move the ball object with the bat if the ball isn't moving yet 
// let the ball stick with the bat;