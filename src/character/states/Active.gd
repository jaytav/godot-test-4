class_name Active
extends State


func _on_Character_turn_ended(character: Character) -> void:
    state_machine.transition_to_state("Idle")
