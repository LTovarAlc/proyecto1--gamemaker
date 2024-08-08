/// Evento "Step" de obj_item_ice
if (global.fire_power_enabled && (x != camera_get_view_x(view_camera[0]) + sprite_width / 2 + 10 || y != camera_get_view_y(view_camera[0]) + sprite_height / 2 + 10)) {
    x = camera_get_view_x(view_camera[0]) + sprite_width / 2 + 10; // Ajusta el 10 para el margen
    y = camera_get_view_y(view_camera[0]) + sprite_height / 2 + 10; // Ajusta el 10 para el margen
}
