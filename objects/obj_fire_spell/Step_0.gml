// Verificar colisiones con obj_wall
if (place_meeting(x, y, obj_wall)) {
    instance_destroy(); 
}

// Calcular la distancia recorrida
var distance_travelled = point_distance(start_x, start_y, x, y);

// Destruir la bala si ha recorrido más de la distancia máxima permitida
if (distance_travelled > max_distance) {
    instance_destroy();
}
