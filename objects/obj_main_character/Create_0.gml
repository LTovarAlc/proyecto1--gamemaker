// Evento Create del personaje principal
hspeed = 0;  // velocidad horizontal
vspeed = 0;  // velocidad vertical
gravity = 0.2;  // gravedad
jump_speed = -5;  // velocidad del salto
move_speed = 1.01;  // velocidad de movimiento

// Inicializar variables para el control de gravedad y colisiones
gravity_active = true;
collision_active = true;

// sprites

sprite_running = spr_main_character_running
sprite_front= spr_main_character