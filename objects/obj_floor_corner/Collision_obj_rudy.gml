/// @description Inserte aquí la descripción
// Puede escribir su código en este editor
// Verificar si hay una colisión con el personaje
if (instance_place(x, y, obj_rudy)) {
    with (obj_rudy) {
        // Solo ajustar si el personaje está cayendo
        if (vspeed > 0) {
            vspeed = 0;
            // Asegurar que el personaje no quede "pegado" a la plataforma
            while (place_meeting(x, y + 1, other)) {
                y -= 1;
            }
        }
        
        // Permitir saltar solo si no está en contacto con el personaje
        if (!place_meeting(x, y + 1, other) && keyboard_check_pressed(vk_space)) {
            vspeed = jump_speed;
        }
    }
}
