// Evento "Draw" de obj_rudy"

// Llama al evento Draw predeterminado para dibujar al personaje normalmente
draw_self();

// Dibujar la barra de vida
var _bar_width = 7; // Ancho de la barra de vida
var _bar_height = 1; // Altura de la barra de vida
var _bar_x = x - _bar_width / 2; // Posición X de la barra de vida
var _bar_y = y - sprite_height / 2 - 10; // Posición Y de la barra de vida

var _health_ratio = current_health / max_health; // Proporción de vida actual

// Dibujar fondo de la barra de vida
draw_set_color(c_black);
draw_rectangle(_bar_x - 1, _bar_y - 1, _bar_x + _bar_width + 1, _bar_y + _bar_height + 1, false);

// Dibujar vida restante
var _green_color = make_color_rgb(0, 206, 75); // Convertir el color hexadecimal 00CE4B a RGB
draw_set_color(_green_color);
draw_rectangle(_bar_x, _bar_y, _bar_x + _bar_width * _health_ratio, _bar_y + _bar_height, false);
