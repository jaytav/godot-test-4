extends Node


func _ready() -> void:
    owner.connect("turn_ended", self, "_on_character_turn_ended")
    

func _on_character_turn_ended(character: Character) -> void:
    for status_effect in get_children():
        status_effect.do()
