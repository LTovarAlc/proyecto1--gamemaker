if (!opened) {
    //colisión con el personaje
    if (place_meeting(x, y, obj_main_character)) {
        // Cambiar al sprite de apertura y reproducir la animación
        sprite_index = spr_chest_opened;
        image_speed = 1; // Iniciar la animación
        opened = true; // Marcar el cofre como abierto
    }
} else {
    // Detener la animación una vez que termine
    if (image_index == image_number - 1) {
        image_speed = 0; // Detener la animación
        image_index = image_number - 1; //se queda en el ultimo frame
    }
}
