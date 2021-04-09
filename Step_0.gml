/// @description Insert description here
// You can write your code in this editor
enter_up = keyboard_check(vk_down);
enter_down = keyboard_check(vk_up);
enter_left = keyboard_check(vk_left);
enter_right = keyboard_check(vk_right);
enter_run = keyboard_check(vk_shift);

//create text box
if (mouse_check_button_pressed(mb_left))
	instance_create_layer(x, y, "Text", obj_textbox);

if (enter_run)
	spd = rspd;
else
	spd = wspd;

//test
if (enter_up){
	image_speed = wspd / 3;
	sprite_index = spr_player_front;
}
if (enter_down){
	image_speed = wspd / 3;
	sprite_index = spr_player_back;
}
if (enter_right){
	image_speed = wspd / 3;
	sprite_index = spr_player_right;
}
if (enter_left){
	image_speed = wspd / 3;
	sprite_index = spr_player_left;
}
if (keyboard_check(vk_nokey)){
	image_speed = 0;
	image_index = 0;
}

moveX = 0;
moveY = 0;

moveY = (enter_up - enter_down) *spd;
if (moveY == 0)
	moveX = (enter_right - enter_left)*spd;

if (moveX != 0){
	if (place_meeting (x+moveX, y, obj_collision)){
		repeat(abs(moveX)){
		if (!(place_meeting(x+sign(moveX), y, obj_collision)))
			x+=sign(moveX)
		else
			break;
		}
		moveX = 0;
	}
}

if (moveY != 0){
	if (place_meeting (x, y+moveY, obj_collision)){
		repeat(abs(moveY)){
		if (!(place_meeting(x, y+moveY, obj_collision)))
			y+=sign(moveY)
		else
			break;
		}
		moveY = 0;
	}
}

var inst = instance_place(x,y,obj_transition);
if (inst != noone){
	with (obj_game){
		if (!doTransition){
			spawnX = inst.targetX;
			spawnY = inst.targetY;
			spawnRoom = inst.targetRoom;
			doTransition = true;
		}
	}
}


x+=moveX;
y+=moveY;