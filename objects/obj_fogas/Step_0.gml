// Evento Step
if (moving_left) {
    x -= 1;
    step_counter += 1;
    
    sprite_index = sprite_left;
    
    if (step_counter >= move_distance) {
        moving_left = false;
    }
} else {
    x += 1;
    step_counter -= 1;
    
    sprite_index = spr_fogas_front;
    
    if (step_counter <= 0) {
        moving_left = true;
    }
}
