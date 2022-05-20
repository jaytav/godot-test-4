class_name Active
extends State


func _ready() -> void:
    owner.connect("turn_ended", self, "_on_Character_turn_ended")


func _on_Character_turn_ended(character: Character) -> void:
    state_machine.transition_to_state("Idle")
