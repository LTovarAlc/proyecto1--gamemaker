
if (!has_caused_damage && bbox_bottom > other.bbox_top && bbox_top < other.bbox_top) {
    // Reducir la vida de Rudy
    other.current_health -= 20;

    // Marcar que la bola ha causado daño
    has_caused_damage = true;

    // Verificar si la vida de Rudy es menor o igual a 0
    if (other.current_health <= 0) {
        // Aquí puedes agregar código para manejar la muerte de Rudy, por ejemplo:
        // instance_destroy(other); // Destruye a Rudy
        // game_restart(); // Reiniciar el juego
        // show_message("You Died!"); // Mostrar un mensaje
    }
}
