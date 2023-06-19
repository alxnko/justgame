extends Control

@export var result: VBoxContainer

# Called when the node enters the scene tree for the first time.
func _ready():
	for n in result.get_children():
		result.remove_child(n)
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

func _on_ExitButton_down():
	get_tree().quit()
