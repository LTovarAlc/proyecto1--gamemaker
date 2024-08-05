if (instance_exists(obj_rudy)) {
    // Obtener la posición de Rudy
    var target_x = obj_rudy.x;
    var target_y = obj_rudy.y;
    
    // Calcular la distancia y dirección hacia Rudy
    var dx = target_x - x;
    var dy = target_y - y;
    
    // Definir la velocidad inicial de la bola de nieve
    var initial_speed = 5;     
    // Calcular el tiempo de vuelo necesario para alcanzar a Rudy
    var flight_time = abs(dx) / initial_speed; // Ajuste inicial, suponiendo hspeed constante
    
    // Ajustar el valor de vspeed para alcanzar la altura correcta al final del tiempo de vuelo
    var vertical_speed = (dy - (0.5 * gravity * sqr(flight_time))) / flight_time;
    
    // Crear la bola de nieve
    var snowball = instance_create_layer(x, y, "spells", obj_snowball);
    
    // Asignar las velocidades calculadas a la bola de nieve
    snowball.hspeed = sign(dx) * initial_speed;
    snowball.vspeed = vertical_speed;
}

// Configurar la alarma para el próximo lanzamiento
alarm[0] = 180;
