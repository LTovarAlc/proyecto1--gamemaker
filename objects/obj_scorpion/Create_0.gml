//create
gravity = 0

// Asignar sprites
scorpion_static = spr_scorpion_static;
scorpion_walk = spr_scorpion_walk;
scorpion_attack = spr_scorpion_attack;
sprite_index = spr_scorpion_static;

// Variables de movimiento
move_speed = 2.7; // velocidad
initial_x = x; // Posición inicial en X
target_x = initial_x + 200; // Posición que se moverá el enemigo
wait_time = 2 * room_speed; // Tiempo de espera
attack_time = 1 * room_speed; // Tiempo de ataque
second_wait_time = 1 * room_speed; // Segundo tiempo de espera

// Variables de estado
state = "move_to_target"; // estado inicial 
wait_timer = 0; // Temporizador de espera

delay_timer = 0.5 * room_speed;

// Variables de vida
max_health = 50; // Vida máxima
current_health = 50; // Vida actual
