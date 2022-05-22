extends Attack


func do(context: Dictionary) -> void:
    var characters: Array = NodeController.get("Characters").get_children()

    for character in characters:
        var character_cell: Vector2 = ActionController.tile_map_action.world_to_map(character.position)

        if character_cell != context.cell:
            continue

        character.do_action("TakeDamage", {
            "damage": damage,
        })


func refresh_cells() -> void:
    var character_cell: Vector2 = ActionController.tile_map_action.world_to_map(owner.position)

    cells = [
        character_cell + Vector2.UP,
        character_cell + Vector2.DOWN,
        character_cell + Vector2.LEFT,
        character_cell + Vector2.RIGHT,
    ]


func visualize_do(context: Dictionary) -> void:
    ActionController.tile_map_action_secondary.clear()

    if !cells.has(context.cell):
        return

    ActionController.tile_map_action_secondary.modulate = tile_map_secondary_modulate
    ActionController.tile_map_action_secondary.set_cellv(context.cell, 0)
