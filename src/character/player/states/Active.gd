extends Active


func enter() -> void:
    MouseController.connect("cell_updated", self, "_on_Mouse_Controller_cell_updated")
    owner.actions.active_state.refresh_cells()
    owner.actions.active_state.visualize_cells()


func unhandled_input(event: InputEvent) -> void:
    if event.is_action_pressed("left_click"):
        owner.do_action(owner.actions.active_state.name, {
            "cell": MouseController.current_cell
        })
    elif event.is_action_pressed("ui_accept"):
        owner.do_action("EndTurn")


func exit() -> void:
    MouseController.disconnect("cell_updated", self, "_on_Mouse_Controller_cell_updated")
    ActionController.tile_map_action.clear()


func _on_Mouse_Controller_cell_updated(from_cell: Vector2, to_cell: Vector2) -> void:
    owner.actions.active_state.visualize_do({
        "cell": ActionController.tile_map_action.world_to_map(owner.get_global_mouse_position())
    })
