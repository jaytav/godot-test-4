extends Action


func do(context: Dictionary = {}) -> void:
    owner.queue_free()
