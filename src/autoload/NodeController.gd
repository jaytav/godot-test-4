extends Node

var nodes: Dictionary = {}


func add(node: Node) -> void:
    nodes[node.name] = node


func get(name: String) -> Node:
    return nodes[name]
