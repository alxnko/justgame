extends Node

var TeamCount = 2
var data = []
var teams = []

var qunow = []
var teamans = 0
var answered = []
var themeint = 0
var quint = 0

var test = [Config.version,["мяу2",{"answer":["1","2","3","4"],"correct":0,"text":"какая это тема?","type":1},{"answer":"да","text":"играешь?","type":0},{"answer":"зайти в редактор","text":"как создать свои вопросы?","type":0},{"answer":["1","3","4","7"],"correct":0,"text":"сколько всего вопросов в теме?","type":1},{"answer":"25","text":"сколько всего вопросов","type":0}],["мяу1",{"answer":"потому что","text":"почему мяу1 второй?","type":0},{"answer":"не знаю","text":"какой цвет фона всегда?","type":0},{"answer":["потому что","да","нет","не знаю"],"correct":0,"text":"почему?","type":1},{"answer":"так","text":"как?","type":0},{"answer":"4","text":"5?","type":0}],["мяу3",{"answer":"по порядку","text":"почему мяу3 третий","type":0},{"answer":["1","2","3","4"],"correct":0,"text":"сколько всего мяу3?","type":1},{"answer":"мяу3","text":"мяу3 или мяу4","type":0},{"answer":["мяу2","мяу1","мяу4","мяу5"],"correct":1,"text":"какая тем перед мяу3?","type":1},{"answer":"мяу","text":"мяу?","type":0}],["мяу4",{"answer":["1","2","3","5"],"correct":3,"text":"сколько всего тем?","type":1},{"answer":"хм","text":"хм?","type":0},{"answer":"4","text":"2+2=?","type":0},{"answer":["4","8","16","32"],"correct":1,"text":"4+4=?","type":1},{"answer":"апрапрпао","text":"аврпа?","type":0}],["мяу5",{"answer":["мя","мяк","мур","мяф"],"correct":2,"text":"мяу?","type":1},{"answer":"не знаю","text":"лол?","type":0},{"answer":["да","нет","иногда","не знаю"],"correct":0,"text":"мяу5?","type":1},{"answer":"да","text":"вопрос 4?","type":0},{"answer":"нет?","text":"вопрос 2","type":0}]]

func openGame(datac,teamc):
	resetGame()
	TeamCount = teamc
	if datac != 'тест': data = Saves.Load(datac)
	else: data = test
	for i in range(teamc):
		teams.append({
			'name':'',
			'score':0
		})
	get_tree().change_scene_to_file("res://Game/Teams.tscn")

func Back():
	resetGame()
	get_tree().change_scene_to_file("res://Menu/Menu.tscn")

func startGame():
	get_tree().change_scene_to_file("res://Game/Game.tscn")

func openQu(qtheme, qu):
	themeint = qtheme
	quint = qu
	qunow = data[qtheme][qu]
	print(qunow.type)
	answered.append(str(qtheme)+str(qu))
	if qunow.type == 0: get_tree().change_scene_to_file("res://Game/QuTypes/Qu0.tscn")
	if qunow.type == 1: get_tree().change_scene_to_file("res://Game/QuTypes/Qu1.tscn")

func nextQu(bool):
	if(bool): teams[teamans].score += quint*100
	if teamans+1 < TeamCount: teamans += 1 
	else: teamans = 0
	if len(answered) >= 25: endGame()
	else: get_tree().change_scene_to_file("res://Game/Game.tscn")

func endGame():
	get_tree().change_scene_to_file("res://Game/Result.tscn")

func resetGame():
	TeamCount = 2
	data = []
	teams = []
	qunow = []
	teamans = 0
	answered = []
	themeint = 0
	quint = 0
