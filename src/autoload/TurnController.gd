extends Node

var characters: Array
var active_character: Node


func run() -> void:
    characters = NodeController.get("Characters").get_children()
    start_next_turn()


func start_next_turn() -> void:
    yield(get_tree().create_timer(0.5), "timeout")
    
    active_character = characters.pop_front()
    active_character.connect("turn_ended", self, "_on_active_character_turn_ended")
    active_character.start_turn()


func _on_active_character_turn_ended(character: Character) -> void:
    character.disconnect("turn_ended", self, "_on_active_character_turn_ended")
    characters.push_back(character)
    start_next_turn()
