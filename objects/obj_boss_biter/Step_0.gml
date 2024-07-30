// Manejador de estados
switch (state) {
    case "move_to_sub_target":
        // Cambia el sprite a la animación de caminar
        sprite_index = boss_biter_walk;
        // Voltea el sprite a la izquierda
        image_xscale = -1;
        // Mueve al jefe hacia la izquierda
        if (x - move_speed > current_sub_target) {
            x -= move_speed;
        } else {
            // Si ha llegado o superado el sub-destino, ajusta la posición y cambia de estado
            x = current_sub_target;
            state = "wait_before_attack";
            wait_timer = wait_before_attack;
        }
        break;

    case "wait_before_attack":
        // Cambia el sprite a la animación estática
        sprite_index = boss_biter_static;
        // Disminuye el temporizador de espera antes del ataque
        wait_timer--;
        if (wait_timer <= 0) {
            // Determina el próximo estado de ataque basado en el sub-destino alcanzado
            if (current_sub_target == initial_x - sub_target_distance) {
                state = "attack_1";
                wait_timer = attack_1_duration;
            } else if (current_sub_target == initial_x - 2 * sub_target_distance) {
                state = "attack_2";
                wait_timer = attack_2_duration;
            } else if (current_sub_target == target_x) {
                state = "attack_3";
                wait_timer = attack_1_duration; // Duración de la mordida
            }
        }
        break;

    case "attack_1":
        // Cambia el sprite a la animación de mordida
        sprite_index = boss_biter_attack_1;
        // Disminuye el temporizador de ataque
        wait_timer--;
        if (wait_timer <= 0) {
            state = "wait_after_attack";
            wait_timer = wait_time - wait_before_attack;
            
            // Reducir la salud de obj_rudy si está en contacto
            if (instance_exists(obj_rudy) && place_meeting(x, y, obj_rudy)) {
                var _rudy = instance_place(x, y, obj_rudy);
                _rudy.current_health -= damage_attack_1; // Reducir salud con mordida
            }
        }
        break;

    case "attack_2":
        // Cambia el sprite a la animación de lenguetazo
        sprite_index = boss_biter_attack_2;
        // Disminuye el temporizador de ataque
        wait_timer--;
        if (wait_timer <= 0) {
            state = "wait_after_attack";
            wait_timer = wait_time - wait_before_attack;
            
            // Reducir la salud de obj_rudy si está en contacto
            if (instance_exists(obj_rudy) && place_meeting(x, y, obj_rudy)) {
                var _rudy = instance_place(x, y, obj_rudy);
                _rudy.current_health -= damage_attack_2; // Reducir salud con lenguetazo
            }
        }
        break;

    case "attack_3":
        // Cambia el sprite a la animación de mordida
        sprite_index = boss_biter_attack_1;
        // Disminuye el temporizador de ataque
        wait_timer--;
        if (wait_timer <= 0) {
            state = "wait_between_attacks";
            wait_timer = 1 * room_speed; // 1 segundos de espera
        }
        break;

    case "wait_between_attacks":
        // Cambia el sprite a la animación estática
        sprite_index = boss_biter_static;
        // Disminuye el temporizador de espera entre ataques
        wait_timer--;
        if (wait_timer <= 0) {
            state = "attack_4"; // Realiza el segundo ataque
            wait_timer = attack_2_duration; // Duración del lenguetazo
        }
        break;

    case "attack_4":
        // Cambia el sprite a la animación de lenguetazo
        sprite_index = boss_biter_attack_2;
        // Disminuye el temporizador de ataque
        wait_timer--;
        if (wait_timer <= 0) {
            state = "wait_after_attack";
            wait_timer = wait_time - wait_before_attack - attack_1_duration;
            
            // Reducir la salud de obj_rudy si está en contacto
            if (instance_exists(obj_rudy) && place_meeting(x, y, obj_rudy)) {
                var _rudy = instance_place(x, y, obj_rudy);
                _rudy.current_health -= damage_attack_2; // Reducir salud con lenguetazo
            }
        }
        break;

    case "wait_after_attack":
        // Cambia el sprite a la animación estática
        sprite_index = boss_biter_static;
        // Disminuye el temporizador de espera después del ataque
        wait_timer--;
        if (wait_timer <= 0) {
            // Cambia al siguiente sub-destino o al estado "move_to_initial" si ha alcanzado el objetivo final
            if (current_sub_target > target_x) {
                current_sub_target -= sub_target_distance;
                state = "move_to_sub_target";
            } else {
                state = "move_to_initial";
            }
        }
        break;

    case "move_to_initial":
        // Cambia el sprite a la animación de caminar
        sprite_index = boss_biter_walk;
        // Voltea el sprite a la derecha para el regreso
        image_xscale = 1;
        // Mueve al jefe de regreso a la posición inicial
        if (x + move_speed < initial_x) {
            x += move_speed;
        } else {
            // Si ha llegado a la posición inicial, ajusta la posición y cambia de estado
            x = initial_x;
            // Reinicia el ciclo
            state = "move_to_sub_target";
            current_sub_target = initial_x - sub_target_distance; // Reinicia el primer sub-destino
        }
        break;

    case "idle":
        // Estado donde el jefe se queda quieto
        sprite_index = boss_biter_static;
        // Aquí podrías agregar cualquier lógica adicional que necesites para este estado
        break;
}

if (current_health <= 0) {
    instance_destroy(); 
    exit;
}
