class_name Character
extends Node2D

signal turn_started(character)
signal turn_ended(character)


func start_turn() -> void:
    emit_signal("turn_started", self)
    

func end_turn() -> void:
    emit_signal("turn_ended", self)    
