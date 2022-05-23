extends Action

onready var character_health_points: Stat = owner.get_node("Stats/HealthPoints")
onready var character_health_bar: HealthBar = owner.get_node("GUI/HealthBar")


func do(context: Dictionary) -> void:
    character_health_points.value -= context.damage

    if character_health_points.value > 0:
        return

    owner.do_action("Die")


func visualize_do(context: Dictionary) -> void:
    var health_points: Array = character_health_bar.get_children()

    for i in range(min(context.damage, len(health_points))):
        var health_point: HealthPoint = health_points.pop_back()
        health_point.breath()
