extends Node


func _ready():
    NodeController.add(get_node("World/Characters"))
    TurnController.run()
    
