extends Node


func _ready():
    NodeController.add(get_node("World/Characters"))
    NodeController.add(get_node("World/TileMaps"))
    ActionController.run()
    TurnController.run()
