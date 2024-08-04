// Evento "Create" de obj_biter

// Asignar sprites
biter_static = spr_biter_static;
biter_running = spr_biter_running;
biter_bite = spr_biter_bite;
sprite_index = spr_biter_static;

// Variables de movimiento
move_speed = 2.7; // velocidad
initial_x = x; // Posición inicial en X
target_x = initial_x + 200; // Posición que se moverá el enemigo
wait_time = 2 * room_speed; // Tiempo de espera en frames
attack_time = 1 * room_speed; // Tiempo de ataque en frames 
second_wait_time = 1 * room_speed; // Segundo tiempo de espera

// Variables de estado
state = "move_to_target"; // estado inicial 
wait_timer = 0; // Temporizador de espera

delay_timer = 0.5;

//if (id == inst_61F1BAE0 && inst_52EF4D7C) {
//    delay_timer = 3.6 * room_speed;
//} else {
//    delay_timer = 0;
//}

// Variables de vida
max_health = 80; // Vida máxima
current_health = 80; // Vida actual
