extends Button

@export var id: int

@export var Good: ColorRect
@export var Bad: ColorRect

func _on_button_down():
	if id == Game.qunow.correct:
		Good.show()
		await get_tree().create_timer(2).timeout
		Game.nextQu(true)
	else:
		Bad.show()
		await get_tree().create_timer(2).timeout
		Game.nextQu(false)
