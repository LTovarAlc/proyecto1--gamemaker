switch (state) {
    case "move_to_target":
        sprite_index = biter_running;
		image_xscale = -1
        x += move_speed;
        if (x >= target_x) {
            x = target_x;
            state = "wait_at_target";
            wait_timer = wait_time;
        }
        break;

    case "wait_at_target":
        sprite_index = biter_static;
        wait_timer--;
        if (wait_timer <= 0) {
            state = "move_to_initial";
        }
        break;

    case "move_to_initial":
        sprite_index = biter_running;
		image_xscale = 1 
        x -= move_speed;
        if (x <= initial_x) {
            x = initial_x;
            state = "wait_at_initial";
            wait_timer = wait_time;
        }
        break;

    case "wait_at_initial":
        sprite_index = biter_static;
        wait_timer--;
        if (wait_timer <= 0) {
            state = "move_to_target";
        }
        break;
}
