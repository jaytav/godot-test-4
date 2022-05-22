extends Action


func do(context: Dictionary) -> void:
    var move_to_position: Vector2 = ActionController.tile_map_action.map_to_world(context.cell)
    move_to_position.y += ActionController.tile_map_action.cell_size.y / 2
    owner.position = move_to_position


func cost(context: Dictionary) -> int:
    var character_cell: Vector2 = ActionController.tile_map_action.world_to_map(owner.position)
    var character_point: int = ActionController.get_vector_point_index(character_cell)
    var cell_point: int = ActionController.get_vector_point_index(context.cell)

    return len(ActionController.astar_movement.get_point_path(character_point, cell_point)) - 1


func refresh_cells() -> void:
    cells.clear()

    var character_cell: Vector2 = ActionController.tile_map_action.world_to_map(owner.position)
    var character_point: int = ActionController.get_vector_point_index(character_cell)

    for point in ActionController.astar_movement.get_points():
        var point_path_cells: Array = ActionController.astar_movement.get_point_path(character_point, point)
        point_path_cells.erase(character_cell)

        if len(point_path_cells) > character_action_points.value:
            continue

        for point_path_cell in point_path_cells:
            if !cells.has(point_path_cell):
                cells.append(point_path_cell)


func visualize_do(context: Dictionary) -> void:
    if !cells.has(context.cell):
        ActionController.tile_map_action_secondary.clear()
        return

    var character_cell: Vector2 = ActionController.tile_map_action.world_to_map(owner.position)
    var character_point: int = ActionController.get_vector_point_index(character_cell)
    var cell_point: int = ActionController.get_vector_point_index(context.cell)

    var point_path_cells: Array = ActionController.astar_movement.get_point_path(character_point, cell_point)
    point_path_cells.erase(character_cell)

    ActionController.tile_map_action_secondary.clear()
    ActionController.tile_map_action_secondary.modulate = tile_map_secondary_modulate

    for point_path_cell in point_path_cells:
        ActionController.tile_map_action_secondary.set_cellv(point_path_cell, 0)
