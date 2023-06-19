extends Control

@export var dataList: OptionButton
@export var teamCount: Label
@export var scaleCount: Label

# Called when the node enters the scene tree for the first time.
func _ready():
	setAutoScale()
	reloadDataList()

func _physics_process(delta):
	updateScaleCount()

func setAutoScale():
	if(get_tree().root.get_content_scale_factor() == 1):
		var nsize = min(DisplayServer.screen_get_size().x/1366.0,DisplayServer.screen_get_size().y/768.0)
		get_tree().root.set_content_scale_factor(nsize)

func reloadDataList():
	dataList.clear()
	dataList.add_item('тест')
	var saves = Saves.getSaves()
	for i in saves:
		dataList.add_item(i)

#Buttons
func _on_EditorButton_down():
	get_tree().change_scene_to_file("res://Editor/Editor.tscn")

func _on_QuitButton_down():
	get_tree().quit()


#Teams
func _on_TeamSlider_value_changed(value):
	teamCount.text = str(value);


#Scale
func _on_MinusSclae_button_down():
	get_tree().root.set_content_scale_factor(get_tree().root.get_content_scale_factor()-0.2)

func _on_PlusScale_button_down():
	get_tree().root.set_content_scale_factor(get_tree().root.get_content_scale_factor()+0.2)

func updateScaleCount(text = ""):
	if(text == ""):
		scaleCount.text = str(snapped(get_tree().root.get_content_scale_factor(),0.1))
	else:
		scaleCount.text = text


func _on_PlayButton_down():
	Game.openGame(dataList.get_item_text(dataList.selected),int(teamCount.text))
