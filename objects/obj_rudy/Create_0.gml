// Evento "Create" de obj_rudy
hspeed = 0;
vspeed = 0;
gravity = 0.2;
jump_speed = -5;
move_speed = 1.2;
path = 100;

// Saltos
jump_count = 0;
max_jumps = 2;

// Sprites
sprite_running = spr_rudy;
sprite_static = spr_rudy_moving;

// Hechizos
global.ice_power_enabled = false;
global.rock_power_enabled = false;
shot_cooldown = 0; // Temporizador de enfriamiento para el disparo

// Variables de vida
lives = 3;
max_health = 170; // Vida máxima
current_health = 170; // Vida actual

is_being_pushed = false; // Variable para verificar si está siendo empujado

// Variables para la posición inicial
start_x = x;
start_y = y;