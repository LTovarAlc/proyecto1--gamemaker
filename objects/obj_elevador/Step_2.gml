if (is_active) {
    // Mover el elevador
    y += vspeed;

    // Verificar los límites
    if (y <= yto && vspeed < 0) {
        vspeed *= -1;
    } else if (y >= yfrom && vspeed > 0) {
        vspeed *= -1;
    }
} else {
    vspeed = 0; // Detener el elevador si no está activo
}
