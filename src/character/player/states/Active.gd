extends Active


func enter() -> void:
    owner.get_node("Actions").active_state.refresh_cells()
    owner.get_node("Actions").active_state.visualize_cells()


func unhandled_input(event: InputEvent) -> void:
    if event is InputEventMouseMotion:
        var mouse_position: Vector2 = owner.get_global_mouse_position()
        var cell: Vector2 = ActionController.tile_map_action.world_to_map(mouse_position)

        owner.actions.active_state.visualize_do(cell)
    elif event.is_action_pressed("ui_accept"):
        owner.do_action("EndTurn")
    elif event.is_action_pressed("left_click"):
        var mouse_position: Vector2 = owner.get_global_mouse_position()
        var cell: Vector2 = ActionController.tile_map_action.world_to_map(mouse_position)

        # do active action
        owner.do_action(owner.actions.active_state.name, cell)


func exit() -> void:
    ActionController.tile_map_action.clear()
