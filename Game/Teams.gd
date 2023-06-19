extends Control

@export var team1: LineEdit
@export var team2: LineEdit
@export var team3: LineEdit
@export var team4: LineEdit
@export var team5: LineEdit

func _ready():
	if Game.TeamCount <= 4:
		team5.hide()
	if Game.TeamCount <= 3:
		team4.hide()
	if Game.TeamCount == 2:
		team3.hide()

func _on_BackButton_down():
	Game.Back()

func _on_PlayButton_down():
	for i in range(Game.TeamCount):
		var name
		match i:
			0: name = team1.text
			1: name = team2.text
			2: name = team3.text
			3: name = team4.text
			4: name = team5.text
		if(name=="" or name==" "): name = "Команда "+str(i+1)
		Game.teams[i].name = name
	Game.startGame()
