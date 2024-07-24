// Evento Step de obj_chest
if (!opened) {
    // Colisión con el personaje
    if (place_meeting(x, y, obj_rudy)) {
        // Cambiar al sprite de apertura y reproducir la animación
        sprite_index = spr_chest_opened;
        image_speed = 1; // Iniciar la animación
        opened = true; // Marcar el cofre como abierto

        // Crear el hechizo en la posición del cofre
        instance_create_layer(x, y, "spells", obj_ice_item);
    }
} else {
    // Detener la animación una vez que termine
    if (image_index == image_number - 1) {
        image_speed = 0; // Detener la animación
        image_index = image_number - 1; // Se queda en el último frame
    }
}
