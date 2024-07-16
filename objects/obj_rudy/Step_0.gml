// MOVIMIENTO VERTICAL
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

// SALTOS
if (keyboard_check_pressed(vk_space) && jump_count < max_jumps) {
    vspeed = jump_speed;
    jump_count += 1;
}

// APLICAR GRAVEDAD
vspeed += gravity;

// MOVER HORIZONTAL
x += hspeed;
if (place_meeting(x, y, obj_floor_top)) {
    if (hspeed > 0) {
        while (!place_meeting(x + 1, y, obj_floor_top) && !place_meeting(x + 1, y, obj_floor_corner) && !place_meeting(x + 1, y, obj_elevador)) {
            x += 1;
        }
    } else if (hspeed < 0) {
        while (!place_meeting(x + 1, y, obj_floor_top) && !place_meeting(x + 1, y, obj_floor_corner) && !place_meeting(x + 1, y, obj_elevador)) {
            x -= 1;
        }
    }
    hspeed = 0;
}

// MOVER VERTICAL
y += vspeed;
if (place_meeting(x, y, obj_wall)) {
    if (vspeed > 0) {
        while (!place_meeting(x + 1, y, obj_floor_top) && !place_meeting(x + 1, y, obj_floor_corner) && !place_meeting(x + 1, y, obj_elevador)) {
            y += 1;
        }
    } else if (vspeed < 0) {
        while (!place_meeting(x + 1, y, obj_floor_top) && !place_meeting(x + 1, y, obj_floor_corner) && !place_meeting(x + 1, y, obj_elevador)) {
            y -= 1;
        }
    }
    vspeed = 0;
}

// Verificar si obj_rudy ya no está sobre el elevador
if (!place_meeting(x, y + 1, obj_elevador)) {
    with (obj_elevador) {
        is_active = false;
    }
}

// Verificar si obj_rudy está en el suelo para reiniciar el contador de saltos
if (place_meeting(x, y + 1, obj_floor_top) || place_meeting(x, y + 1, obj_floor_corner) || place_meeting(x, y + 1, obj_elevador)) {
    jump_count = 0;
}
