class_name Character
extends Node2D

signal turn_started(character)
signal turn_ended(character)

onready var actions: StateMachine = $Actions


func start_turn() -> void:
    emit_signal("turn_started", self)


func end_turn() -> void:
    emit_signal("turn_ended", self)


func do_action(action_name: String, cell: Vector2 = Vector2.ZERO) -> void:
    var action: Action = actions.get_node(action_name)

    if action == null:
        return

    if !action.cells.empty() and !action.cells.has(cell):
        return

    var action_cost = action.cost(cell)

    if action_cost > action.character_action_points.value:
        return

    actions.transition_to_state(action_name)
    actions.active_state.do(cell)

    ActionController.refresh_astar_movement()
    ActionController.tile_map_action_secondary.clear()
    action.character_action_points.value -= action_cost
    action.refresh_cells()
    action.visualize_cells()
    action.visualize_do(cell)

    # transition back to default action
    actions.transition_to_state(actions.initial_state)
