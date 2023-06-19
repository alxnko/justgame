extends MarginContainer



func PlusScale():
	get_tree().root.set_content_scale_factor(get_tree().root.get_content_scale_factor()+0.2)

func MinusSclae():
	get_tree().root.set_content_scale_factor(get_tree().root.get_content_scale_factor()-0.2)

func FullScreen():
	if DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_FULLSCREEN:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	else: DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
