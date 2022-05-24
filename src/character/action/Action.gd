class_name Action
extends State

export var manual: bool
export var tile_map_modulate: Color
export var tile_map_secondary_modulate: Color
export var cost: int
export var texture: Texture

var cells: Array

onready var character_action_points: Stat = owner.get_node("Stats/ActionPoints")


func do(context: Dictionary) -> void:
    pass


func cost(context: Dictionary) -> int:
    return cost


func refresh_cells() -> void:
    pass


func visualize_do(context: Dictionary) -> void:
    pass


func visualize_cells() -> void:
    ActionController.tile_map_action.clear()
    ActionController.tile_map_action.modulate = tile_map_modulate

    for cell in cells:
        ActionController.tile_map_action.set_cellv(cell, 0)


func set_active() -> void:
    state_machine.transition_to_state(name)

    refresh_cells()
    visualize_cells()
    visualize_do({
        "cell": MouseController.current_cell
    })
