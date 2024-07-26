// Evento "Collision" de obj_ice_spell con obj_biter

// Reducir la vida de obj_biter en un 25%
other.current_health -= other.max_health * 0.25;

// Asegurarse de que la vida no sea negativa
if (other.current_health < 0) {
    other.current_health = 0;
}

// Destruir el hechizo
instance_destroy();
