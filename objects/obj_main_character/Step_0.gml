// Movimiento horizontal
if (keyboard_check(vk_left)) {
    hspeed = -move_speed;  // Mover a la izquierda
    sprite_index = spr_main_character_running;
    image_xscale = -1; // Voltear el sprite hacia la izquierda
} else if (keyboard_check(vk_right)) {
    hspeed = move_speed;  // Mover a la derecha
    sprite_index = spr_main_character_running;
    image_xscale = 1; // Orientar el sprite hacia la derecha
} else {
    hspeed = 0;  
    sprite_index = sprite_front;
    // Mantener la orientación del sprite según la última dirección
}

// Verificar si el personaje está sobre el suelo, una plataforma o una rampa
var _on_ground = place_meeting(x, y + 1, obj_floor) || place_meeting(x, y + 1, obj_platform) || place_meeting(x, y + 1, obj_floor);

// Salto
if (keyboard_check_pressed(vk_space) && _on_ground) {
    vspeed = jump_speed;  // Saltar solo si el personaje está en contacto con el suelo, una plataforma o una rampa
}

// Aplicar gravedad solo si no está en contacto con el suelo, una plataforma o una rampa y la gravedad está activa
if (gravity_active && !_on_ground) {
    vspeed += gravity;
}

// Movimiento
x += hspeed;
y += vspeed;

// Colisión con el suelo solo si las colisiones están activas
if (collision_active) {
    if (place_meeting(x, y, obj_floor) || place_meeting(x, y, obj_platform)) {
        if (vspeed > 0) { // Solo ajustar si está cayendo
            vspeed = 0;
            while (place_meeting(x, y, obj_floor) || place_meeting(x, y, obj_platform)) {
                y -= 1;
            }
        }
    } else if (place_meeting(x, y, obj_floor)) {
        // Ajustar la posición y en función de la inclinación de la rampa
        while (place_meeting(x, y, obj_floor)) {
            y -= 1;
        }
        vspeed = 0;
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
