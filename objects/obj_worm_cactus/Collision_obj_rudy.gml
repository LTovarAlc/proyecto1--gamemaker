// Verificar si la roca está encima de Rudy (su parte inferior toca la parte superior de Rudy)
// Y si la roca no ha causado daño previamente
if (!has_caused_damage && bbox_bottom > other.bbox_top && bbox_top < other.bbox_top) {
    // Reducir la vida de Rudy
    other.current_health -= 50;

    // Marcar que la roca ha causado daño
    has_caused_damage = true;

    // Verificar si la vida de Rudy es menor o igual a 0
    if (other.current_health <= 0) {
        // Aquí puedes agregar código para manejar la muerte de Rudy, por ejemplo:
        // instance_destroy(other); // Destruye a Rudy
        // game_restart(); // Reiniciar el juego
        // show_message("You Died!"); // Mostrar un mensaje
    }
}
