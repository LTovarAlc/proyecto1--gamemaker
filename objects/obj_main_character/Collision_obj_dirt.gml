// Evento de colisión en el objeto intraspasable

// Si colisiona con el personaje principal
if (other.object_index == obj_main_character) {
    // Detener el movimiento del personaje principal
    other.speed = 0;
    
    // Alternativamente, puedes ajustar la posición del personaje para que no atraviese el objeto
    if (other.x < x) {
        other.x = x - other.sprite_width;
    } else if (other.x > x) {
        other.x = x + sprite_width;
    }
    
    if (other.y < y) {
        other.y = y - other.sprite_height;
    } else if (other.y > y) {
        other.y = y + sprite_height;
    }
}

// Puedes agregar condiciones similares para otras entidades que no deberían atravesar el objeto
