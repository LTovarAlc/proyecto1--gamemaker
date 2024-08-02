// Evento "Step" de obj_rudy
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
if (place_meeting(x, y, obj_floor_desert)) {
    if (hspeed > 0) {
        while (!place_meeting(x + 1, y, obj_floor_desert) & !place_meeting(x + 1, y, obj_floor_artic)) {
            x += 1;
        }
    } else if (hspeed < 0) {
        while (!place_meeting(x + 1, y, obj_floor_desert) & !place_meeting(x + 1, y, obj_floor_artic)) {
            x -= 1;
        }
    }
    hspeed = 0;
}

// MOVER VERTICAL
y += vspeed;
if (place_meeting(x, y, obj_wall)) {
    if (vspeed > 0) {
        while (!place_meeting(x + 1, y, obj_floor_desert) & !place_meeting(x + 1, y, obj_floor_artic) ) {
            y += 1;
        }
    } else if (vspeed < 0) {
        while (!place_meeting(x + 1, y, obj_floor_desert) & !place_meeting(x + 1, y, obj_floor_artic)) {
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
if (place_meeting(x, y + 1, obj_floor_desert )& !place_meeting(x + 1, y, obj_floor_artic) ) {
    jump_count = 0;
}

// Disparo de hechizo con temporizador
if (shot_cooldown > 0) {
    shot_cooldown -= 1; // Disminuir el temporizador
}

if (keyboard_check_pressed(ord("Q")) && global.rock_power_enabled && shot_cooldown <= 0) {
    var _shot_direction = image_xscale == 1 ? 0 : 180; // 0 grados hacia la derecha, 180 grados hacia la izquierda
    var _spell = instance_create_layer(x, y - 12, "spells", obj_rock_spell);
    _spell.direction = _shot_direction;
    _spell.speed = 6; // Ajusta la velocidad según sea necesario
    shot_cooldown = room_speed; // Ajustar a 1 segundo (room_speed es el número de pasos por segundo)
}

if (keyboard_check_pressed(ord("Q")) && global.ice_power_enabled && shot_cooldown <= 0) {
    var _shot_direction = image_xscale == 1 ? 0 : 180; // 0 grados hacia la derecha, 180 grados hacia la izquierda
    var _spell = instance_create_layer(x, y - 12, "spells", obj_ice_spell);
    _spell.direction = _shot_direction;
    _spell.speed = 6; // Ajusta la velocidad según sea necesario
    shot_cooldown = room_speed; // Ajustar a 1 segundo (room_speed es el número de pasos por segundo)
}

// Disminucion de barra de vida
if (keyboard_check_pressed(ord("H"))) {
    current_health -= 10;
    if (current_health < 0) current_health = 0; // Asegurarse de que la vida no sea negativa
}

if (current_health <= 0) {
    instance_destroy(); 
    exit;
}

// Verificar si el personaje ha alcanzado el borde derecho de la room1
if (x >= room_width - sprite_width / 2) {
    // Cambiar a level2
    room_goto(rm_level2);
}