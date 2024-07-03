// Evento colisión con obj_main_character
if (other.vspeed > 0) { // Si el personaje principal está cayendo
    // Verificar si el personaje está encima del obj_fogas
    if (other.y > y) {
        // El personaje saltó sobre el obj_fogas, así que destruimos el 
    } else {
        // El personaje tocó el obj_fogas por los lados, desactivamos la gravedad y las colisiones para el personaje
        gravity_active = false;
        collision_active = false;
    }
} else {
    // El personaje no está cayendo, no hacemos nada especial
    // Puedes agregar más lógica aquí si es necesario
}
