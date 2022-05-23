class_name HealthPoint
extends TextureRect

onready var animation_player: AnimationPlayer = $AnimationPlayer


func breath() -> void:
    MouseController.connect("cell_clicked", self, "_on_Mouse_Controller_cell_clicked")
    MouseController.connect("cell_updated", self, "_on_Mouse_Controller_cell_updated")
    animation_player.play("Breath")


func _unhandled_input(event: InputEvent) -> void:
    if event.is_action_pressed("ui_focus_next"):
        if animation_player.is_playing():
            animation_player.stop()

            if get_parent():
                modulate = get_parent().health_point_modulate


func _on_Mouse_Controller_cell_clicked(cell: Vector2) -> void:
    MouseController.disconnect("cell_clicked", self, "_on_Mouse_Controller_cell_clicked")
    MouseController.disconnect("cell_updated", self, "_on_Mouse_Controller_cell_updated")
    animation_player.stop()

    if get_parent():
        modulate = get_parent().health_point_modulate


func _on_Mouse_Controller_cell_updated(from_cell: Vector2, to_cell: Vector2) -> void:
    MouseController.disconnect("cell_clicked", self, "_on_Mouse_Controller_cell_clicked")
    MouseController.disconnect("cell_updated", self, "_on_Mouse_Controller_cell_updated")
    animation_player.stop()

    if get_parent():
        modulate = get_parent().health_point_modulate
