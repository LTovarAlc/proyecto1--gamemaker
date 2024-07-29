// Evento "Create" de obj_rudy
hspeed = 0;
vspeed = 0;
gravity = 0.2;
jump_speed = -5;
move_speed = 0.8;
path = 100;

// Saltos
jump_count = 0;
max_jumps = 2;

// Sprites
sprite_running = spr_rudy;
sprite_static = spr_rudy_moving;

// Hechizos
global.ice_power_enabled = false;
shot_cooldown = 0; // Temporizador de enfriamiento para el disparo

// Variables de vida
max_health = 100; // Vida máxima
current_health = 100; // Vida actual

is_being_pushed = false; // Variable para verificar si está siendo empujado
