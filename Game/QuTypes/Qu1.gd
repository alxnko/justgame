extends Control

@export var teamName: Label
@export var themeName: Label
@export var quInt: Label
@export var quText: Label

@export var option1: Button
@export var option2: Button
@export var option3: Button
@export var option4: Button

# Called when the node enters the scene tree for the first time.
func _ready():
	teamName.text = Game.teams[Game.teamans].name
	themeName.text = Game.data[Game.themeint][0]
	quInt.text = str(Game.quint)+"00"
	quText.text = Game.qunow.text
	option1.text = Game.qunow.answer[0]
	option2.text = Game.qunow.answer[1]
	option3.text = Game.qunow.answer[2]
	option4.text = Game.qunow.answer[3]
