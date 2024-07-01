// Movimiento horizontal
if (keyboard_check(vk_left)) {
    hspeed = -move_speed;  // Mover a la izquierda
} else if (keyboard_check(vk_right)) {
    hspeed = move_speed;  // Mover a la derecha
} else {
    hspeed = 0;  
}

// Salto
if (keyboard_check_pressed(vk_space) && place_meeting(x, y + 1, obj_floor)) {
    vspeed = jump_speed;  // Saltar solo si el personaje está en contacto con el suelo
}

// Aplicar gravedad solo si no está en contacto con el suelo
if (!place_meeting(x, y + 1, obj_floor)) {
    vspeed += gravity;
}

// Movimiento
x += hspeed;
y += vspeed;

// Colisión con el suelo
if (place_meeting(x, y, obj_floor)) {
    vspeed = 0;
    while (place_meeting(x, y, obj_floor)) {
        y -= 1;
    }
}
