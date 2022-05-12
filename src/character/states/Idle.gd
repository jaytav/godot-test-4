extends State


func _on_Character_turn_started(character: Character) -> void:
    state_machine.transition_to_state("Active")
