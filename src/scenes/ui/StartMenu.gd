extends Control


func _ready() -> void:
    $Button.connect("pressed", self, "_on_button_pressed")


func _on_button_pressed() -> void:
    visible = false
    TurnController.run()
