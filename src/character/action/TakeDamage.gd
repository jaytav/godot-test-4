extends Action

onready var character_health_points: Stat = owner.get_node("Stats/HealthPoints")


func do(context: Dictionary) -> void:
    character_health_points.value -= context.damage

    if character_health_points.value > 0:
        return

    owner.do_action("Die")
