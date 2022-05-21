class_name Action
extends State

export var tile_map_modulate: Color
export var tile_map_secondary_modulate: Color
export var cost: int

var cells: Array

onready var character_action_points: Stat = owner.get_node("Stats/ActionPoints")


func do(cell: Vector2) -> void:
    pass


func cost(cell: Vector2) -> int:
    return cost


func refresh_cells() -> void:
    pass


func visualize_do(cell: Vector2) -> void:
    pass


func visualize_cells() -> void:
    ActionController.tile_map_action.clear()
    ActionController.tile_map_action.modulate = tile_map_modulate

    for cell in cells:
        ActionController.tile_map_action.set_cellv(cell, 0)
