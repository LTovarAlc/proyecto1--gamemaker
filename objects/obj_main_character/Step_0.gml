// Movimiento horizontal
if (keyboard_check(vk_left)) {
    hspeed = -move_speed;  // Mover a la izquierdas
	sprite_index = sprite_running
} else if (keyboard_check(vk_right)) {
    hspeed = move_speed;  // Mover a la derecha
	sprite_index = sprite_running
} else {
    hspeed = 0;  
	sprite_index = sprite_front
}

// Verificar si el personaje está sobre el suelo o una plataforma
var _on_ground = place_meeting(x, y + 1, obj_dirt) || place_meeting(x, y + 1, obj_platform);

// Salto
if (keyboard_check_pressed(vk_space) && _on_ground) {
    vspeed = jump_speed;  // Saltar solo si el personaje está en contacto con el suelo o una plataforma
}

// Aplicar gravedad solo si no está en contacto con el suelo o una plataforma y la gravedad está activa
if (gravity_active && !_on_ground) {
    vspeed += gravity;
}

// Movimiento
x += hspeed;
y += vspeed;

// Colisión con el suelo solo si las colisiones están activas
if (collision_active && (place_meeting(x, y, obj_dirt) || place_meeting(x, y, obj_platform))) {
    vspeed = 0;
    while (place_meeting(x, y, obj_dirt) || place_meeting(x, y, obj_platform)) {
        y -= 1;
    }
}

// Colisión con obj_fogas
if (place_meeting(x, y, obj_fogas)) {
    var _fogas = instance_place(x, y, obj_fogas);
    if (_fogas != noone) {
        if (vspeed > 0) { // Si está cayendo (ha saltado encima de obj_fogas)
            vspeed = jump_speed; // Realiza otro salto
            instance_destroy(_fogas); // Destruye obj_fogas
        } else { // Si ha colisionado lateralmente
            gravity_active = false;
            collision_active = false;
        }
    }
}
