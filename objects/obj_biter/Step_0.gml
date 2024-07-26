if (delay_timer > 0) {
    delay_timer--;
    return;
}

switch (state) {
    case "move_to_target":
        sprite_index = biter_running;
        image_xscale = -1;
        x += move_speed;
        
        // Empujar a obj_rudy
        if (instance_exists(obj_rudy) && place_meeting(x, y, obj_rudy)) {
            var rudy = instance_place(x, y, obj_rudy);
            rudy.x += move_speed; // Empujar a obj_rudy en la dirección del movimiento
        }
        
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
            state = "attack_at_target";
            wait_timer = attack_time;
        }
        break;

    case "attack_at_target":
        sprite_index = biter_bite;
        wait_timer--;
        if (wait_timer <= 0) {
            state = "second_wait_at_target";
            wait_timer = second_wait_time;
            
            // Verificar colisión con obj_rudy y causar daño por mordida
            if (instance_exists(obj_rudy) && place_meeting(x, y, obj_rudy)) {
                var rudy = instance_place(x, y, obj_rudy);
                rudy.current_health -= (rudy.max_health * 0.3); // 30% de la vida actual
                
                // Mensaje de depuración
                show_message("Mordida: obj_rudy recibe 30% de daño. Vida actual: " + string(rudy.current_health));
            }
        }
        break;

    case "second_wait_at_target":
        sprite_index = biter_static;
        wait_timer--;
        if (wait_timer <= 0) {
            state = "move_to_initial";
        }
        break;

    case "move_to_initial":
        sprite_index = biter_running;
        image_xscale = 1;
        x -= move_speed;
        
        // Empujar a obj_rudy
        if (instance_exists(obj_rudy) && place_meeting(x, y, obj_rudy)) {
            var rudy = instance_place(x, y, obj_rudy);
            rudy.x -= move_speed; // Empujar a obj_rudy en la dirección opuesta del movimiento
        }
        
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
            state = "attack_at_initial";
            wait_timer = attack_time;
        }
        break;

    case "attack_at_initial":
        sprite_index = biter_bite;
        wait_timer--;
        if (wait_timer <= 0) {
            state = "second_wait_at_initial";
            wait_timer = second_wait_time;
            
            // Verificar colisión con obj_rudy y causar daño por mordida
            if (instance_exists(obj_rudy) && place_meeting(x, y, obj_rudy)) {
                var rudy = instance_place(x, y, obj_rudy);
                rudy.current_health -= (rudy.max_health * 0.3); // 30% de la vida actual
                
            }
        }
        break;

    case "second_wait_at_initial":
        sprite_index = biter_static;
        wait_timer--;
        if (wait_timer <= 0) {
            state = "move_to_target";
        }
        break;
}

if (current_health <= 0) {
    instance_destroy(); 
    exit;
}
