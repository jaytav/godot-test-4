extends Active


func unhandled_input(event: InputEvent) -> void:
    if event.is_action_pressed("ui_accept"):
        owner.end_turn()
