extends Button

@export var qtheme: int
@export var qu: int

# Called when the node enters the scene tree for the first time.
func _ready():
	if Game.answered.has(str(qtheme)+str(qu)): self.hide()
	self.text = str(qu)+"00"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_down():
	Game.openQu(qtheme,qu)
