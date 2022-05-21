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
    if follow_node:
        follow_node.disconnect("tree_exiting", self, "_on_follow_node_tree_exiting")

    follow_node = node
    follow_node.connect("tree_exiting", self, "_on_follow_node_tree_exiting")


func _on_follow_node_tree_exiting() -> void:
    follow_node = null
