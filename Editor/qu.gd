extends VBoxContainer

@export var labelText = "Вопрос"
@export var label: Label

var data = {}

@onready var type0 = preload("res://Editor/ans_text.tscn").instantiate()
@onready var type1 = preload("res://Editor/ans_list.tscn").instantiate()
@onready var trueAns = preload("res://Editor/true_ans.tscn").instantiate()

# Called when the node enters the scene tree for the first time.
func _ready():
	label.text = labelText


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func getData():
	data.text = $QuText.text
	data.type = $QuInfo/QuType.selected
	if data.type == 0:
		data.answer = $AnsText.text
	elif data.type == 1:
		data.correct = $QuInfo/TrueAns/QuType.selected
		data.answer = []
		data.answer.append($AnsList/Option1.text)
		data.answer.append($AnsList/Option2.text)
		data.answer.append($AnsList/Option3.text)
		data.answer.append($AnsList/Option4.text)
	return data

func setData(data):
	$QuText.text = data.text
	$QuInfo/QuType.selected = data.type
	if data.type == 0:
		setType(0)
		$AnsText.text = data.answer
	elif data.type == 1:
		setType(1)
		$QuInfo/TrueAns.selected = data.correct
		$AnsList/Option1.text = data.answer[0]
		$AnsList/Option2.text = data.answer[1]
		$AnsList/Option3.text = data.answer[2]
		$AnsList/Option4.text = data.answer[3]

func _on_QuType_selected(index):
	setType(index)

func setType(index):
	match index:
		0:
			if self.has_node("AnsList"):
				self.remove_child($AnsList)
				self.get_node("QuInfo").remove_child($QuInfo/TrueAns)
				print(self.get_node("QuInfo").get_children())
				
				self.add_child(type0)
		1:
			if self.has_node("AnsText"):
				self.remove_child($AnsText)
				self.get_node("QuInfo").add_child(trueAns)
				self.add_child(type1)
