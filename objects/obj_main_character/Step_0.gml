// movimiento horizontal
if(keyboard_check(vk_left)){
	hspeed = move_speed;
} else if(keyboard_check(vk_right)) {
	hspeed = 0;
}

// saltos
 if(keyboard_check(vk_space) && vspeed = 00){
	vspeed = jump_speed
 }
 
 //gravity 
 vspeed = gravity
 
 // mover al mono
 x += hspeed
 y += vspeed
 
 //colision con el suelo 
 if(y > room_height - sprite_height / 2 ){
	y = room_height - sprite_height / 2;
 }