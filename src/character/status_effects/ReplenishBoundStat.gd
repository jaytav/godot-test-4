extends StatusEffect

export var stat_path: NodePath

onready var stat: Stat = get_node(stat_path)


func do() -> void:
    stat.value = stat.max_value
