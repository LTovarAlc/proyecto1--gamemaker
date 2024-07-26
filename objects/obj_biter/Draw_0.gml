// Evento "Draw" de obj_biter

// Llama al evento Draw predeterminado para dibujar al personaje normalmente
draw_self();

// Dibujar la barra de vida
var bar_width = 12; // Ancho de la barra de vida
var bar_height = 1.5; // Altura de la barra de vida
var bar_x = x - bar_width / 2; // Posición X de la barra de vida
var bar_y = y - sprite_height / 2 - 20; // Posición Y de la barra de vida

var health_ratio = current_health / max_health; // Proporción de vida actual

// Dibujar fondo de la barra de vida
draw_set_color(c_black);
draw_rectangle(bar_x - 1, bar_y - 1, bar_x + bar_width + 1, bar_y + bar_height + 1, false);

// Dibujar vida restante
draw_set_color(c_red);
draw_rectangle(bar_x, bar_y, bar_x + bar_width * health_ratio, bar_y + bar_height, false);
