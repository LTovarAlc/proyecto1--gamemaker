/// @description Inserte aquí la descripción
// Puede escribir su código en este editor
// Reducir la vida del enemigo en 22 puntos
other.current_health -= damage;

// Asegurarse de que la vida no sea negativa
if (other.current_health < 0) {
    other.current_health = 0;
}

// Destruir el hechizo
instance_destroy();
