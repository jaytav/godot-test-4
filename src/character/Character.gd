class_name Character
extends Node2D

signal turn_started(character)
signal turn_ended(character)
signal action_done(character, action)

onready var actions: StateMachine = $Actions


func start_turn() -> void:
    emit_signal("turn_started", self)


func end_turn() -> void:
    emit_signal("turn_ended", self)


func do_action(action_name: String, context: Dictionary = {}) -> void:
    var action: Action = actions.get_node(action_name)

    if action == null:
        return

    if !action.cells.empty() and !action.cells.has(context.cell):
        return

    var action_cost = action.cost(context)

    if action_cost > action.character_action_points.value:
        return

    actions.transition_to_state(action_name)
    actions.active_state.do(context)

    action.character_action_points.value -= action_cost
    emit_signal("action_done", self, actions.active_state)

    ActionController.tile_map_action.clear()
    ActionController.tile_map_action_secondary.clear()

    # timeout after doing action to wait for things to change before continuing
    # maybe actions should give information on how long it takes (animations and other)
    yield(get_tree().create_timer(0.1), "timeout")

    ActionController.refresh_astar_movement()

    # transition back to default action
    actions.transition_to_state(actions.initial_state)
    actions.active_state.refresh_cells()

    if action_name != "EndTurn" and name == "Player":
        actions.active_state.visualize_cells()
        actions.active_state.visualize_do({
            "cell": ActionController.tile_map_action.world_to_map(owner.get_global_mouse_position())
        })
