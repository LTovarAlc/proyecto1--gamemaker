// Movimiento horizontal con teclas "A" y "D"
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
    sprite_index = sprite_front;
}

// Verificar si el personaje está sobre el suelo o una plataforma
var _on_ground = place_meeting(x, y + 1, obj_floor) || place_meeting(x, y + 1, obj_platform) || place_meeting(x, y + 1, obj_elevator);

// Saltos
if (keyboard_check_pressed(vk_space) && _on_ground) {
    vspeed = jump_speed; // Saltar solo si el personaje está en contacto con el suelo o la plataforma
}

// Aplicar gravedad solo si no está en contacto con el suelo o una plataforma y la gravedad está activa
if (gravity_active && !_on_ground) {
    vspeed += gravity;
}

x += hspeed;
y += vspeed;

// Colisión con el suelo solo si las colisiones están activas
if (collision_active) {
    if (place_meeting(x, y + vspeed, obj_floor) || place_meeting(x, y + vspeed, obj_platform) || place_meeting(x, y + vspeed, obj_elevator)) {
        y = floor(y);
        vspeed = 0;
    }
}

// Colisión con obj_fogas
if (place_meeting(x, y, obj_fogas)) {
    var _fogas = instance_place(x, y, obj_fogas);
    if (_fogas != noone) {
        if (vspeed > 0) { // caer encima del fogas
            vspeed = jump_speed; // salto extra (efecto rebote)
            instance_destroy(_fogas);
        } else { // colisión lateral
            gravity_active = false;
            collision_active = false;
        }
    }
}