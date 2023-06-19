extends ScrollContainer

var data = []

@export var tname: LineEdit

@export var qu1: VBoxContainer
@export var qu2: VBoxContainer
@export var qu3: VBoxContainer
@export var qu4: VBoxContainer
@export var qu5: VBoxContainer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func getData():
	data.clear()
	data.append(tname.text)
	data.append(qu1.getData())
	data.append(qu2.getData())
	data.append(qu3.getData())
	data.append(qu4.getData())
	data.append(qu5.getData())
	return data

func setData(data):
	tname.text = data[0]
	qu1.setData(data[1])
	qu2.setData(data[2])
	qu3.setData(data[3])
	qu4.setData(data[4])
	qu5.setData(data[5])
