extends Node2D

@onready var data = DataBase.database
@onready var Vbox = $ScrollContainer/VBoxContainer
var taskScene = preload("res://UI/taskItem.tscn")


func _ready():
	insertRow()

func _process(delta):
	pass

func insertRow():
	var nil = data.select_rows("task", "id > 0", ["*"])
	for row in nil :
		addHabit(row["name"],row["keterangan"],row["id"],row["status"])
	
func addHabit(Nm : String, Pn : String, i :int, st : int):
	var new_habit = taskScene.instantiate()
	new_habit.id = i
	new_habit.nama = Nm
	new_habit.ket = Pn
	Vbox.add_child(new_habit)
	Vbox.queue_sort()


func _on_add_button_down():
	var dt = {
		"name" : " ",
		"keterangan": " ",
		"status": 0
	}
	data.insert_row("task", dt)
	insertRow()
