extends HBoxContainer

@export var colorPicker: ColorPickerButton

var data = {
	"color" : {
		"r" : 0,
		"g" : 0,
		"b" : 0
	}
}

# Called when the node enters the scene tree for the first time.
func _ready():
	data = Saves.loadSettings()
	if data == {}:
		colorPicker.color = RenderingServer.get_default_clear_color()
	else:
		RenderingServer.set_default_clear_color(Color(data.color.r,data.color.g,data.color.b))
		colorPicker.color = Color(data.color.r,data.color.g,data.color.b)


func _on_color_picker_button_color_changed(color):
	RenderingServer.set_default_clear_color(color)
	data = {
		"color" : {
			"r" : color.r,
			"g" : color.g,
			"b" : color.b
		}
	}
	Saves.saveSettings(data)
