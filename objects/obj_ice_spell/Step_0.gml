// Evento "Step" de obj_ice_spell

// Verificar colisiones con obj_wall
if (place_meeting(x, y, obj_wall)) {
    instance_destroy(); // Destruir el disparo al colisionar con una pared
}
