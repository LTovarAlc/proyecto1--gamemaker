// Verificar colisiones con obj_wall
if (place_meeting(x, y, obj_wall) || place_meeting(x, y, obj_biter)) {
    instance_destroy(); // Destruir el disparo al colisionar con una pared o un enemigo
    // Agrega la lógica para el efecto de colisión, como reducir la vida del enemigo
}

// Calcular la distancia recorrida
var distance_travelled = point_distance(start_x, start_y, x, y);

// Destruir la bala si ha recorrido más de la distancia máxima permitida
if (distance_travelled > max_distance) {
    instance_destroy();
}
