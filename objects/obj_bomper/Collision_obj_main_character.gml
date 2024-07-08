// Evento de colisión en obj_bomper
if (collision_rectangle(x, y, x + sprite_width, y + sprite_height, obj_main_character))
{
    // Calcular la dirección del rebote (por ejemplo, hacia la izquierda)
    var bounceDirection = -1; // Valor negativo para mover hacia la izquierda
    
    // Cambiar la velocidad del personaje
    obj_main_character.hspeed = 5 * bounceDirection; // Ajusta la velocidad según tu necesidad
    
    // Simular el traslado (disminuir gradualmente la velocidad)
    obj_main_character.hspeed *= 0.8; // Puedes ajustar este valor para controlar la intensidad del rebote
}
