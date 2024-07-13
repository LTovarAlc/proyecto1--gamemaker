if (instance_place(x, y, obj_rudy)) {
    is_active = true;
    // Ajustar la velocidad del elevador si `obj_rudy` está sobre él
    with (obj_rudy) {
        if (vspeed > 0) {
            vspeed = 0;
            // Asegurar que el personaje no quede "pegado" a la plataforma
            while (place_meeting(x, y + 1, other)) {
                y -= 1;
            }
        }
    }
    // Actualizar la velocidad del elevador
    vspeed = -0.5; // Velocidad negativa para que el elevador suba
}
