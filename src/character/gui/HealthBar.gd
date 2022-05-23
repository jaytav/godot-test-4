class_name HealthBar
extends GridContainer

export var health_point_modulate: Color

const HealthPoint = preload("res://src/character/gui/HealthPoint.tscn")

onready var character_health_points: Stat = owner.get_node("Stats/HealthPoints")


func _ready() -> void:
    character_health_points.connect("updated", self, "_on_character_health_points_updated")
    columns = character_health_points.max_value
    
    for i in range(character_health_points.value):
        var health_point: TextureRect = HealthPoint.instance()
        health_point.modulate = health_point_modulate
        add_child(health_point)


func _on_character_health_points_updated(from_value: int, to_value: int) -> void:
    var health_points = get_children()

    for i in range(from_value - to_value):
        remove_child(health_points[i])
