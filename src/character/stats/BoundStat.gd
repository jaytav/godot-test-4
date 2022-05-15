extends Stat

export var min_value: int
export var max_value: int


func _ready() -> void:
    if !_initial_value:
        value = max_value


func _set_value(to_value: int) -> void:
    ._set_value(int(clamp(to_value, min_value, max_value)))
