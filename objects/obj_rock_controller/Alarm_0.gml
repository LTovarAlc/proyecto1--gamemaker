// Generar una roca en una posición aleatoria dentro del área
var x_position = irandom_range(x_min, x_max);
var y_position = y_min; // Generar desde la parte superior del área
instance_create_layer(x_position, y_position, "spells", obj_worm_cactus);

// Reajustar la alarma para repetir
alarm[0] = 210; //
