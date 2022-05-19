extends Active

export var action: NodePath


func enter() -> void:
    var actions: StateMachine = owner.get_node("Actions")
    
    if action:
        actions.transition_to_state(get_node(action).name)

    actions.active_state.do()
