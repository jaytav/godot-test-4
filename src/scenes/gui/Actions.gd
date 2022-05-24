extends Control

const ActionTile = preload("res://src/scenes/gui/ActionTile.tscn")

onready var action_tiles: HBoxContainer = $ActionTiles


func _ready() -> void:
    yield(get_tree().root.get_node("Main"), "ready")
    
    for character in NodeController.get("Characters").get_children():
        character.connect("turn_started", self, "_on_character_turn_started")


func _on_character_turn_started(character: Character) -> void:
    for action_tile in action_tiles.get_children():
        action_tiles.remove_child(action_tile)

    for action in character.actions.get_children():
        if !action.manual:
            continue

        var action_tile = ActionTile.instance()
        action_tile.action = action
        action_tiles.add_child(action_tile)
