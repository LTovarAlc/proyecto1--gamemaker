if (transition_state == "fade_in") {
    image_alpha += transition_speed;
    if (image_alpha >= 1) {
        image_alpha = 1;
        transition_state = "fade_out";
        room_goto(target_room); // Cambiar de room cuando la pantalla está completamente negra
    }
} else if (transition_state == "fade_out") {
    image_alpha -= transition_speed;
    if (image_alpha <= 0) {
        image_alpha = 0;
        instance_destroy(); // Destruir el objeto de transición cuando se desvanezca
    }
}
