extends Node


func _ready():
    CameraController.camera = get_node("World/Camera2D")
    NodeController.add(get_node("World/Characters"))
    NodeController.add(get_node("World/TileMaps"))
    NodeController.add(get_node("World/Camera2D"))
    ActionController.run()
    TurnController.run()
