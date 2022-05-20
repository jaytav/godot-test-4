extends State


func _ready() -> void:
    owner.connect("turn_started", self, "_on_Character_turn_started")


func _on_Character_turn_started(character: Character) -> void:
    state_machine.transition_to_state("Active")
