// Evento de colisión de obj_main_character con obj_item_ice
if (place_meeting(x, y, obj_ice_item)) {
    var ice_instance = instance_place(x, y, obj_ice_item);
    if (ice_instance != noone) {
        global.ice_power_enabled = true;
        // Mover a la esquina superior izquierda de la vista de la cámara
        ice_instance.x = camera_get_view_x(view_camera[0]) + ice_instance.sprite_width / 2 + 10; // Ajusta el 10 para el margen
        ice_instance.y = camera_get_view_y(view_camera[0]) + ice_instance.sprite_height / 2 + 10; // Ajusta el 10 para el margen
        ice_instance.gravity = 0; // Desactivar la gravedad
        ice_instance.persistent = true; // Hacer que el objeto sea persistente
    }
}
