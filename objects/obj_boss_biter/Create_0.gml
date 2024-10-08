// Asignar sprites
boss_biter_static = spr_boss_biter_static;
boss_biter_walk = spr_boss_biter_moving;
boss_biter_attack_1 = spr_boss_biter_bite;
boss_biter_attack_2 = spr_boss_biter_lick;
sprite_index = boss_biter_static;

// Variables de movimiento
move_speed = 1.3; // velocidad
initial_x = x; // Posición inicial en X
sub_target_distance = 160; // distancia de cada sub-movimiento
target_x = initial_x - 480; // posición final a la que se moverá el jefe
wait_time = 6 * room_speed; // Tiempo total de espera en frames (6 segundos)
wait_before_attack = 5 * room_speed; // Tiempo de espera antes del ataque (5 segundos)

// Variables de estado
state = "move_to_sub_target"; // estado inicial 
wait_timer = 0; // Temporizador de espera
current_sub_target = initial_x - sub_target_distance; // Primer sub-destino

// Duraciones de los ataques
attack_1_duration = 0.5 * room_speed; // Tiempo de ataque 1 (0.5 segundos)
attack_2_duration = 0.8 * room_speed; // Tiempo de ataque 2 (0.8 segundos)

// Daño de los ataques
damage_attack_1 = 55; // Daño de la mordida
damage_attack_2 = 43; // Daño del lenguetazo

max_health = 530; // vida maxima
current_health = 530; // vida actual
