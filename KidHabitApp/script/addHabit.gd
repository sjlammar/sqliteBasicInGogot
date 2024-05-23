extends Control

@onready var hb = $VBoxContainer/habit
@onready var pn = $VBoxContainer/poin

var dat = DataBase.database
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_back_button_down():
	get_tree().change_scene_to_file("res://scene/habit.tscn")


func _on_add_button_down():
	var dt = {
		"name" : hb.text,
		"poin" : int(pn.text)
	}
	dat.insert_row("habit", dt)
	get_tree().change_scene_to_file("res://scene/habit.tscn")
