// Evento Create del personaje principal
hspeed = 0;  // velocidad horizontal
vspeed = 0;  // velocidad vertical
gravity = 0.5;  // gravedad
jump_speed = -10;  // velocidad del salto
move_speed = 1.3;  // velocidad de movimiento

// Inicializar variables para el control de gravedad y colisiones
gravity_active = true;
collision_active = true;

// sprites

sprite_running = spr_main_characterRunning
sprite_front = spr_main_character