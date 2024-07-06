// Evento Collision con obj_fogas
var _fogas = other;

if (vspeed > 0 && bbox_bottom <= _fogas.bbox_top + 5) { 
    // Si el personaje principal está cayendo y está por encima de obj_fogas
    vspeed = jump_speed / 2;
	_fogas.gravity_active = false
	_fogas.collision_active = false
	gravity_active = true
	collision_active = true
    with (_fogas) {
    }
} else {
    gravity_active = false;
    collision_active = false;
}
