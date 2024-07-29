// Evento de colisión de obj_main_character con obj_item_ice
if (place_meeting(x, y, obj_ice_item)) {
    var _ice_instance = instance_place(x, y, obj_ice_item);
    if (_ice_instance != noone) {
        global.ice_power_enabled = true;
        // Mover a la esquina superior izquierda de la vista de la cámara
        _ice_instance.x = camera_get_view_x(view_camera[0]) + _ice_instance.sprite_width / 2 + 10; // Ajusta el 10 para el margen
        _ice_instance.y = camera_get_view_y(view_camera[0]) + _ice_instance.sprite_height / 2 + 10; // Ajusta el 10 para el margen
        _ice_instance.gravity = 0; // Desactivar la gravedad
        _ice_instance.persistent = true; // Hacer que el objeto sea persistente
    }
}
