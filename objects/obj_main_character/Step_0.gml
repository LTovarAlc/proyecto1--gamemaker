// Movimiento horizontal
if (keyboard_check(vk_left)) {
    hspeed = -move_speed;  // Mover a la izquierda
} else if (keyboard_check(vk_right)) {
    hspeed = move_speed;  // Mover a la derecha
} else {
    hspeed = 0;  // Detener movimiento horizontal si no se presiona ninguna tecla
}

// Salto
if (keyboard_check_pressed(vk_space) && vspeed < 0.6) {  // Saltar solo si el personaje está en el suelo
    vspeed = jump_speed;
	show_debug_message("espacio presionao")
}

// Aplicar gravedad
vspeed += gravity;

// Mover al personaje
x += hspeed;
y += vspeed;

// Colisión con el suelo
if (y > room_height - sprite_height / 2) {  // Suponiendo que el suelo está en la parte inferior de la room
    y = room_height - sprite_height / 2;
    vspeed = 0;  // Detener la velocidad vertical al tocar el suelo
}