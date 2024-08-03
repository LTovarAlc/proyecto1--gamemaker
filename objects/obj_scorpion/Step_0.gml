// script scr_check_floor
if (place_meeting(x, y + 1, obj_floor_desert)) {
    vspeed = 0;
    while (!place_meeting(x, y + 1, obj_floor_desert)) {
        y += 1;
    }
} else {
    vspeed = 5; //evita vibracion
}

if (delay_timer > 0) {
    delay_timer--;
    return;
}

switch (state) {
    case "move_to_target":
        sprite_index = scorpion_walk;
        image_xscale = -1; // Orientar sprite hacia la derecha
        x += move_speed; // Mover hacia la derecha
        
        // Empujar a obj_rudy si hay colisión
        if (instance_exists(obj_rudy) && place_meeting(x, y, obj_rudy)) {
            var _rudy = instance_place(x, y, obj_rudy);
            _rudy.x += move_speed; // Empujar a obj_rudy a la derecha
        }
        
        if (x >= target_x) {
            x = target_x;
            state = "wait_at_target";
            wait_timer = wait_time;
        }
        break;

    case "wait_at_target":
        sprite_index = scorpion_static; // Sprite estático
        wait_timer--;
        if (wait_timer <= 0) {
            state = "attack_at_target";
            wait_timer = attack_time;
        }
        break;

    case "attack_at_target":
        sprite_index = scorpion_attack; // Sprite de ataque
        wait_timer--;
        if (wait_timer <= 0) {
            state = "second_wait_at_target";
            wait_timer = second_wait_time;
            
            // Si hay colisión con obj_rudy, reducir su salud
            if (instance_exists(obj_rudy) && place_meeting(x, y, obj_rudy)) {
                var _rudy = instance_place(x, y, obj_rudy);
                _rudy.current_health -= (_rudy.max_health * 0.3); // Reducir salud en 30%
            }
        }
        break;

    case "second_wait_at_target":
        sprite_index = scorpion_static; // Sprite estático
        wait_timer--;
        if (wait_timer <= 0) {
            state = "move_to_initial";
        }
        break;

    case "move_to_initial":
        sprite_index = scorpion_walk;
        image_xscale = 1; // Orientar sprite hacia la izquierda
        x -= move_speed; // Mover hacia la izquierda
        
        // Empujar a obj_rudy si hay colisión
        if (instance_exists(obj_rudy) && place_meeting(x, y, obj_rudy)) {
            var _rudy = instance_place(x, y, obj_rudy);
            _rudy.x -= move_speed; // Empujar a obj_rudy a la izquierda
        }
        
        if (x <= initial_x) {
            x = initial_x;
            state = "wait_at_initial";
            wait_timer = wait_time;
        }
        break;

    case "wait_at_initial":
        sprite_index = scorpion_static; // Sprite estático
        wait_timer--;
        if (wait_timer <= 0) {
            state = "attack_at_initial";
            wait_timer = attack_time;
        }
        break;

    case "attack_at_initial":
        sprite_index = scorpion_attack; // Sprite de ataque
        wait_timer--;
        if (wait_timer <= 0) {
            state = "second_wait_at_initial";
            wait_timer = second_wait_time;
            
            if (instance_exists(obj_rudy) && place_meeting(x, y, obj_rudy)) {
                var _rudy = instance_place(x, y, obj_rudy);
                _rudy.current_health -= (_rudy.max_health * 0.3); // Reducir salud en 30%
            }
        }
        break;

    case "second_wait_at_initial":
        sprite_index = scorpion_static; // Sprite estático
        wait_timer--;
        if (wait_timer <= 0) {
            state = "move_to_target";
        }
        break;
}

// Destrucción del scorpion si su salud es 0 o menor
if (current_health <= 0) {
    instance_destroy(); 
    exit;
}
