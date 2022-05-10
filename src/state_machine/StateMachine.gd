class_name StateMachine
extends Node

signal transitioned(from_state, to_state)

export var initial_state: NodePath
export var debug: bool

var active_state: State


func _init() -> void:
    connect("transitioned", self, "_on_StateMachine_transitioned")


func _ready() -> void:
    yield(owner, "ready")
    assert(!initial_state.is_empty(), "initial_state is not defined")

    transition_to_state(initial_state)
    

func _process(delta: float) -> void:
    active_state.process(delta)


func _physics_process(delta: float) -> void:
    active_state.physics_process(delta)
    

func _unhandled_input(event: InputEvent) -> void:
    active_state.unhandled_input(event)


func transition_to_state(state: String) -> void:
    if active_state:
        active_state.exit()

    var from_state: State = active_state
    active_state = get_node(state)
    active_state.enter()

    emit_signal("transitioned", from_state, active_state)


func _on_StateMachine_transitioned(from_state: State, to_state: State) -> void:
    if !debug:
        return

    if from_state:
        print("%s.%s transitioned from %s to %s" % [owner.name, name, from_state.name, to_state.name])
    else:
        print("%s.%s transitioned to %s" % [owner.name, name, to_state.name])
