extends Control

var action: Action setget _set_action


func _ready() -> void:
    connect("gui_input", self, "_on_gui_input")


func _set_action(to_action: Action) -> void:
    action = to_action
    $TextureRect.modulate = action.tile_map_secondary_modulate
    $TextureRect.texture = action.texture


func _on_gui_input(event: InputEvent) -> void:
    if event.is_action_pressed("left_click"):
        action.set_active()
