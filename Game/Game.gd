extends Control

@export var teamans: Label

@export var theme1: VBoxContainer
@export var theme2: VBoxContainer
@export var theme3: VBoxContainer
@export var theme4: VBoxContainer
@export var theme5: VBoxContainer

@export var result: VBoxContainer

# Called when the node enters the scene tree for the first time.
func _ready():
	loadData()

func loadData():
	teamans.text = Game.teams[Game.teamans].name
	
	theme1.get_child(0).text = Game.data[1][0]
	theme2.get_child(0).text = Game.data[2][0]
	theme3.get_child(0).text = Game.data[3][0]
	theme4.get_child(0).text = Game.data[4][0]
	theme5.get_child(0).text = Game.data[5][0]
	
	for n in result.get_children():
		result.remove_child(n)
	var label = Label.new()
	label.text = "Счет:"
	result.add_child(label)
	var score = [] + Game.teams
	score.sort_custom(func(a, b): return a.score > b.score)
	for i in score:
		var node = HBoxContainer.new()
		var namel = Label.new()
		namel.text = i.name+":"
		node.add_child(namel)
		var scorel = Label.new()
		scorel.text = str(i.score)
		node.add_child(scorel)
		result.add_child(node)

func _on_BackButton_down():
	Game.Back()


func _on_EndButton_down():
	Game.endGame()
