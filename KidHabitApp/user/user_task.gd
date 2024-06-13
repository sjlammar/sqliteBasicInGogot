extends Control
@onready var data = DataBase.database
@onready var Vbox = $ScrollContainer/VBoxContainer
var taskScene = preload("res://user/list_user_task.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	insertRow()
	pass

func _process(delta):
	pass

func insertRow():
	var nil = data.select_rows("listTask", "idUser == "+str(DataBase.idsession), ["*"])
	for row in nil :
		addHabit(row["id"],row["status"])
	
func addHabit(i :int,st :int):
	var new_habit = taskScene.instantiate()
	new_habit.id = i
	new_habit.status = st
	Vbox.add_child(new_habit)
	Vbox.queue_sort()

func _on_add_button_down():
	var dt = {
		"idUser" : DataBase.idsession,
		"status" : 0
	}
	data.insert_row("listTask", dt)
	get_tree().reload_current_scene()
	""" 
	
	"""
