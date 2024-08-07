

// Asegúrate de que spr_heart esté correctamente asignado
if (sprite_exists(spr_heart)) {
    // Dibujar los corazones
    var heart_x = 10; // Posición inicial X para los corazones
    var heart_y = 5; // Posición inicial Y para los corazones
    var heart_spacing = sprite_get_width(spr_heart) + 0; // Espacio entre los corazones

    for (var i = 0; i < lives; i++) {
        draw_sprite(spr_heart, 0, heart_x + i * heart_spacing, heart_y);
    }
}
