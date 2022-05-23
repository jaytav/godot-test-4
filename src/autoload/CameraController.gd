extends Node

var camera: Camera2D
var follow_node: Node2D
var follow_speed: int = 500
var camera_move_velocity: Vector2
var camera_move_speed: int = 15
var manual: bool = false


func _process(delta: float) -> void:
    if !follow_node or manual or camera.position.distance_to(follow_node.position) < 2:
        return

    var direction = camera.position.direction_to(follow_node.position)
    camera.position += direction * follow_speed * delta


func _physics_process(delta: float) -> void:
    camera_move_velocity = Vector2()

    if Input.is_action_pressed("right"):
        camera_move_velocity += Vector2.RIGHT
    if Input.is_action_pressed("left"):
        camera_move_velocity += Vector2.LEFT
    if Input.is_action_pressed("down"):
        camera_move_velocity += Vector2.DOWN
    if Input.is_action_pressed("up"):
        camera_move_velocity += Vector2.UP

    if !manual and camera_move_velocity != Vector2.ZERO:
        manual = true

    camera_move_velocity = camera_move_velocity.normalized() * camera_move_speed
    camera.position += camera_move_velocity


func _unhandled_input(event: InputEvent) -> void:
    if event.is_action_pressed("left"):
        pass
    elif event.is_action_pressed("right"):
        pass
    elif event.is_action_pressed("up"):
        pass
    elif event.is_action_pressed("down"):
        pass

func follow(node: Node2D) -> void:
    if follow_node:
        follow_node.disconnect("tree_exiting", self, "_on_follow_node_tree_exiting")

    manual = false
    follow_node = node
    follow_node.connect("tree_exiting", self, "_on_follow_node_tree_exiting")


func _on_follow_node_tree_exiting() -> void:
    follow_node = null
