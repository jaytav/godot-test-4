extends TextureRect

func destroy() -> void:
    print("destroying hp")
    queue_free()
