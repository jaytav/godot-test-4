extends Active


func enter() -> void:
    owner.actions.active_state.refresh_cells()
    owner.actions.active_state.visualize_cells()


func unhandled_input(event: InputEvent) -> void:
    if event is InputEventMouseMotion:
        owner.actions.active_state.visualize_do({
            "cell": ActionController.tile_map_action.world_to_map(owner.get_global_mouse_position())
        })
    elif event.is_action_pressed("left_click"):
        owner.do_action(owner.actions.active_state.name, {
            "cell": ActionController.tile_map_action.world_to_map(owner.get_global_mouse_position())
        })
    elif event.is_action_pressed("ui_focus_next"):
        var active_action: Action = owner.actions.active_state
        var actions: Array = owner.actions.get_children()
        var next_action: Action

        for i in range(actions.size()):
            if actions[i] == active_action:
                var from_index: int = i + 1

                while range(actions.size()).has(from_index):
                    if actions[from_index].manual:
                        next_action = actions[from_index]
                        break

                if next_action == null:
                    for y in range(actions.size()):
                        if actions[y].manual:
                            next_action = actions[y]
                            break

                break

        owner.actions.transition_to_state(next_action.name)
        next_action.refresh_cells()
        next_action.visualize_cells()
        next_action.visualize_do({
            "cell": ActionController.tile_map_action.world_to_map(owner.get_global_mouse_position())
        })
    elif event.is_action_pressed("ui_accept"):
        owner.do_action("EndTurn")


func exit() -> void:
    ActionController.tile_map_action.clear()
