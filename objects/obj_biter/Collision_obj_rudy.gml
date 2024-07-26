// Evento de colisión con obj_rudy
if (state == "move_to_target" || state == "move_to_initial") {
    // Daño por atropello
    obj_rudy.current_health -= (obj_rudy.max_health * 0.1); // 10% de la vida actual

}
