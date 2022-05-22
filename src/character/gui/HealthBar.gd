extends TextureProgress

onready var health_points: Stat = owner.get_node("Stats/HealthPoints")


func _ready() -> void:
    health_points.connect("updated", self, "_on_character_health_points_updated")

    value = health_points.value
    min_value = health_points.min_value
    max_value = health_points.max_value


func _on_character_health_points_updated(from_value: int, to_value: int) -> void:
    value = to_value

