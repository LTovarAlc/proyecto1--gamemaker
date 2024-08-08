// Evento "Botón Izquierdo del Ratón Presionado" de obj_button_play
if (mouse_check_button_pressed(mb_left)) {
    // Acción a realizar cuando se presiona el botón
    // Por ejemplo, cambiar a otra room o iniciar el juego
    room_goto(rm_level1); // Cambia al primer nivel o al nivel deseado
}
