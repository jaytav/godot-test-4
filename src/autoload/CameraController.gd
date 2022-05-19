extends Node

var camera: Camera2D
var follow_node: Node2D
var follow_speed: int = 500


func _process(delta: float) -> void:
    if !follow_node or camera.position.distance_to(follow_node.position) < 2:
        return

    var direction = camera.position.direction_to(follow_node.position)
    camera.position += direction * follow_speed * delta


func follow(node: Node2D) -> void:
    follow_node = node
