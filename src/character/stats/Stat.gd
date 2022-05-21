class_name Stat
extends Node

signal updated(from_value, to_value)

export var initial_value: int
export var modulate: Color

var value: int setget _set_value


func _ready() -> void:
    value = initial_value


func _set_value(to_value: int) -> void:
    # only change value if it is different
    if value == to_value:
        return

    var from_value: int = value
    value = to_value

    emit_signal("updated", from_value, value)
