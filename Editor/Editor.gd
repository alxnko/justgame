extends Control

@export var dataList: OptionButton

@export var theme1: ScrollContainer
@export var theme2: ScrollContainer
@export var theme3: ScrollContainer
@export var theme4: ScrollContainer
@export var theme5: ScrollContainer

var data = []

# Called when the node enters the scene tree for the first time.
func _ready():
	NameEdit_changed("")
	reloadDataList()

func reloadDataList():
	dataList.clear()
	var saves = Saves.getSaves()
	for i in saves:
		dataList.add_item(i)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func save():
	getData()
	Saves.Save($CenterContainer/VBoxContainer/NewData/NameEdit.text,data)

func _on_BackButton_down():
	get_tree().change_scene_to_file("res://Menu/Menu.tscn")

func getData():
	data.clear()
	data.append(Config.version)
	data.append(theme1.getData())
	data.append(theme2.getData())
	data.append(theme3.getData())
	data.append(theme4.getData())
	data.append(theme5.getData())

func setData():
	data = Saves.Load(dataList.get_item_text(dataList.selected))
	theme1.setData(data[1])
	theme2.setData(data[2])
	theme3.setData(data[3])
	theme4.setData(data[4])
	theme5.setData(data[5])
	$CenterContainer/VBoxContainer/NewData/NameEdit.text = dataList.get_item_text(dataList.selected)
	NameEdit_changed(dataList.get_item_text(dataList.selected))

func _on_NewButton_down():
	save()


func NameEdit_changed(new_text):
	if(Saves.hasSave(new_text)):
		$CenterContainer/VBoxContainer/NewData/Label.text = 'перезапись'
	else:
		$CenterContainer/VBoxContainer/NewData/Label.text = 'новый'
