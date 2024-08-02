// Evento de colisión del piso con obj_ice_spell
if (instance_exists(obj_rock_item)) {
    if (instance_place(x, y, obj_rock_item)) {
        with (obj_rock_item) {
            // Verificar si el personaje está cayendo
            if (vspeed > 0) {
                // Invertir la dirección de la velocidad vertical y reducirla para simular el rebote
                vspeed = -vspeed * 0.7; // Ajusta el 0.7 para cambiar la energía perdida en cada rebote

                // Asegurar que el personaje no quede "pegado" al piso
                while (place_meeting(x, y + 1, other)) {
                    y -= 1;
                }
            }
        }
    }
}