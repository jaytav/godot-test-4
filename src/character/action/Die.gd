extends Action


func _ready() -> void:
    owner.get_node("Stats/HealthPoints").connect("updated", self, "_on_character_health_points_updated")


func do(cell: Vector2) -> void:
    owner.queue_free()


func _on_character_health_points_updated(from_value: int, to_value: int) -> void:
    if to_value > 0:
        return

    owner.do_action(name)
