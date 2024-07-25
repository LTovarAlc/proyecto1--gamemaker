// Evento "Step" de obj_ice_spell
// Aquí puedes agregar la lógica para lo que sucede cuando el disparo colisiona con algo, por ejemplo:
if (place_meeting(x, y, obj_wall) || place_meeting(x, y, obj_biter)) {
    instance_destroy(); // Destruir el disparo al colisionar
    // Agrega la lógica para el efecto de colisión, como reducir la vida del enemigo
}
