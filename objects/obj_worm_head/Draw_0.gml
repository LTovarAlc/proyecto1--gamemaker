// Evento "Draw" de obj_biter

draw_self();

// Dibujar la barra de vida
var _bar_width = 30; // Ancho
var _bar_height = 1.5; // Altura
var _bar_x = x - _bar_width / 2; // Posición X 
var _bar_y = y - sprite_height / 2 - 20; // Posición Y 

var _health_ratio = current_health / max_health; // Vida actual

// Dibujar fondo de la barra de vida
draw_set_color(c_black);
draw_rectangle(_bar_x - 1, _bar_y - 1, _bar_x + _bar_width + 1, _bar_y + _bar_height + 1, false);

// Dibujar vida restante
draw_set_color(c_red);
draw_rectangle(_bar_x, _bar_y, _bar_x + _bar_width * _health_ratio, _bar_y + _bar_height, false);
