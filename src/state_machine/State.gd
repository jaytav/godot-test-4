class_name State
extends Node

onready var state_machine = get_parent()


func enter() -> void:
    pass


func exit() -> void:
    pass


func process(delta: float) -> void:
    pass


func physics_process(delta: float) -> void:
    pass


func unhandled_input(event: InputEvent) -> void:
    pass
