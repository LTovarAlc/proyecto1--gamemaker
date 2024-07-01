// Verificar si hay una colisión con el personaje
if (instance_place(x, y, obj_main_character)) {
    with (obj_main_character) {
        if (vspeed > 0) { // Solo ajustar si el personaje está cayendo
            vspeed = 0;
            while (place_meeting(x, y + 1, other)) {
                y -= 1;
            }
        }
    }
}
