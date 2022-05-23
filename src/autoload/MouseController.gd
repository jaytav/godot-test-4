extends Node

signal cell_updated(from_cell, to_cell)
signal cell_clicked(cell)

var world: Node2D
var current_cell: Vector2


func run() -> void:
    world = NodeController.get("World")


func _unhandled_input(event: InputEvent) -> void:
    if event is InputEventMouseMotion:
        var mouse_position: Vector2 = world.get_global_mouse_position()
        var mouse_cell: Vector2 = ActionController.tile_map_action.world_to_map(mouse_position)
        
        if mouse_cell == current_cell:
            return
        
        var from_cell: Vector2 = current_cell
        current_cell = mouse_cell
        emit_signal("cell_updated", from_cell, current_cell)
    elif event.is_action_pressed("left_click"):
        emit_signal("cell_clicked", current_cell)
