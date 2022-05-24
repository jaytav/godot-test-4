extends Action


func refresh_cells() -> void:
    cells = [ActionController.tile_map_action.world_to_map(owner.position)]


func visualize_do(context: Dictionary) -> void:
    pass
