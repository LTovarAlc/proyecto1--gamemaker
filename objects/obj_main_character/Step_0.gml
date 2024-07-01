// Movimiento horizontal
if (keyboard_check(vk_left)) {
    hspeed = -move_speed;  // Mover a la izquierda
} else if (keyboard_check(vk_right)) {
    hspeed = move_speed;  // Mover a la derecha
} else {
    hspeed = 0;  
}

// Verificar si el personaje está sobre el suelo o una plataforma
var on_ground = place_meeting(x, y + 1, obj_floor) || place_meeting(x, y + 1, obj_platform);

// Salto
if (keyboard_check_pressed(vk_space) && on_ground) {
    vspeed = jump_speed;  // Saltar solo si el personaje está en contacto con el suelo o una plataforma
}

// Aplicar gravedad solo si no está en contacto con el suelo o una plataforma
if (!on_ground) {
    vspeed += gravity;
}

// Movimiento
x += hspeed;
y += vspeed;

// Colisión con el suelo
if (place_meeting(x, y, obj_floor) || place_meeting(x, y, obj_platform)) {
    vspeed = 0;
    while (place_meeting(x, y, obj_floor) || place_meeting(x, y, obj_platform)) {
        y -= 1;
    }
}