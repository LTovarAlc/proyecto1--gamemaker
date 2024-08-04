// Variables de estado para el salto
var _is_on_floor;

// Verificar si hay una colisión con el suelo (obj_wall u obj_floor_top)
_is_on_floor = place_meeting(x, y + 1, obj_wall) || place_meeting(x, y + 1, obj_floor_snow);

// Verificar si hay una colisión con el personaje
if (instance_exists(obj_boss_snow)) {
    if (instance_place(x, y, obj_boss_snow)) {
        with (obj_boss_snow) {
            // Ajustar si el personaje está cayendo
            if (vspeed > 0) {
                vspeed = 0;
                while (place_meeting(x, y + 1, other)) {
                    y -= 1;
                }
            }
            
        }
    }
}