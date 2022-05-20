extends Active

export var action_path: NodePath

onready var action: Action = get_node(action_path)


func enter() -> void:
    owner.do_action(action.name)
