// Asignar sprites
biter_static = spr_biter_static;
biter_running = spr_biter_running;
sprite_index = spr_biter_static;

// Variables de movimiento
move_speed = 2; // Velocidad de movimiento del enemigo
initial_x = x; // Posición inicial en X
target_x = initial_x + 200; // Posición a la que se moverá el enemigo (ajusta según tus necesidades)
wait_time = 7 * room_speed; // Tiempo de espera en frames (7 segundos)

// Variables de estado
state = "move_to_target"; // Estado inicial
wait_timer = 0; // Temporizador de espera
