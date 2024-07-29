// Variables de estado para el salto
var _is_on_floor;

// Verificar si hay una colisión con el suelo (obj_wall u obj_floor_top)
_is_on_floor = place_meeting(x, y + 1, obj_wall) || place_meeting(x, y + 1, obj_floor_top);

// Verificar si hay una colisión con el personaje
if (instance_exists(obj_rudy)) {
    if (instance_place(x, y, obj_rudy)) {
        with (obj_rudy) {
            // Ajustar si el personaje está cayendo
            if (vspeed > 0) {
                vspeed = 0;
                // Asegurar que el personaje no quede "pegado" a la plataforma
                while (place_meeting(x, y + 1, other)) {
                    y -= 1;
                }
            }
            
            // Permitir saltar solo si está en el suelo
            if (_is_on_floor && keyboard_check_pressed(vk_space)) {
                vspeed = jump_speed;
            }
        }
    }
}
