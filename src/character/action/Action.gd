class_name Action
extends State

export var modulate: Color

var cells: Array

onready var character_action_points: Stat = owner.get_node("Stats/ActionPoints")


func do(cell: Vector2) -> void:
    pass


func cost(cell: Vector2) -> int:
    return 0


func refresh_cells() -> void:
    pass


func visualize_cells() -> void:
    ActionController.tile_map_action.clear()
    ActionController.tile_map_action.modulate = modulate

    for cell in cells:
        ActionController.tile_map_action.set_cellv(cell, 0)
