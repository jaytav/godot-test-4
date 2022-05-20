extends Action


func do(cell: Vector2 = Vector2.ZERO) -> void:
    owner.end_turn()

    # transition back to default action
    state_machine.transition_to_state(state_machine.initial_state)
