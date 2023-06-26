extends Control

@export var teamName: Label
@export var themeName: Label
@export var quInt: Label
@export var quText: Label
@export var ansText: Label

@export var ansPanel: PanelContainer
@export var showButton: Button
@export var trueFalse: HBoxContainer

@export var Good: ColorRect
@export var Bad: ColorRect

# Called when the node enters the scene tree for the first time.
func _ready():
	teamName.text = Game.teams[Game.teamans].name
	themeName.text = Game.data[Game.themeint][0]
	quInt.text = str(Game.quint)+"00"
	quText.text = Game.qunow.text
	ansText.text = Game.qunow.answer

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_ShowButton_down():
	ansPanel.show()
	showButton.hide()
	trueFalse.show()

func _on_TrueButton_down():
	Good.show()
	await get_tree().create_timer(2).timeout
	Game.nextQu(true)

func _on_FalseButton_down():
	Bad.show()
	await get_tree().create_timer(2).timeout
	Game.nextQu(false)
