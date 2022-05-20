class_name Character
extends Node2D

signal turn_started(character)
signal turn_ended(character)

onready var actions: StateMachine = $Actions


func start_turn() -> void:
    emit_signal("turn_started", self)
    

func end_turn() -> void:
    emit_signal("turn_ended", self)    


func do_action(action: String = "", cell: Vector2 = Vector2.ZERO) -> void:
    if actions.get_node(action) == null:
        return

    actions.transition_to_state(action)
    actions.active_state.do(cell)

    # transition back to default action
    actions.transition_to_state(actions.initial_state)
