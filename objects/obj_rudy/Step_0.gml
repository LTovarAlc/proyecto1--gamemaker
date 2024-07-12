//MOVIMIENTO VERTICAL
if (keyboard_check(ord("A"))) {
    hspeed = -move_speed;
    sprite_index = sprite_running;
    image_xscale = -1;
} else if (keyboard_check(ord("D"))) {
    hspeed = move_speed; 
    sprite_index = sprite_running;
    image_xscale = 1;
} else {
    hspeed = 0;
    sprite_index = sprite_static;
}

//SALTOS
if (keyboard_check_pressed(vk_space) && !place_meeting(x + 1, y, obj_floor_top) && !place_meeting(x + 1, y, obj_floor_corner)) {
    vspeed = jump_speed;
}

// APLICAR GRAVEDAD
vspeed += gravity;

// MOVER HORIZONTAL
x += hspeed;
if (place_meeting(x, y, obj_floor_top)) {
    if (hspeed > 0) {
        while (!place_meeting(x + 1, y, obj_floor_top) && !place_meeting(x + 1, y, obj_floor_corner) && !place_meeting(x + 1, y, obj_floor_corner )) {
            x += 1;
        }
    } else if (hspeed < 0) {
        while (!place_meeting(x + 1, y, obj_floor_top) && !place_meeting(x + 1, y, obj_floor_corner)) {
            x -= 1;
        }
    }
    hspeed = 0;
}

// MOVER VERTICAL
y += vspeed;
if (place_meeting(x, y, obj_wall)) {
    if (vspeed > 0) {
        while (!place_meeting(x + 1, y, obj_floor_top) && !place_meeting(x + 1, y, obj_floor_corner)) {
            y += 1;
        }
    } else if (vspeed < 0) {
        while (!place_meeting(x + 1, y, obj_floor_top) && !place_meeting(x + 1, y, obj_floor_corner)) {
            y -= 1;
        }
    }
    vspeed = 0;
}
