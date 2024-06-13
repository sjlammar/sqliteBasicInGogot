extends Control
@onready var data = DataBase.database
@onready var Vbox = $ScrollContainer/VBoxContainer
var taskScene = preload("res://user/habit_list.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	insertRow()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func insertRow():
	var nil = data.select_rows("habit", "idUser == "+str(DataBase.idsession), ["*"])
	for row in nil :
		addHabit(row["name"],row["desc"],row["status"],row["id"])
	
func addHabit(Nm : String, Pn : String, st:bool,i :int):
	var new_habit = taskScene.instantiate()
	new_habit.id = i
	new_habit.nama = Nm
	new_habit.ket = Pn
	new_habit.cek = st
	Vbox.add_child(new_habit)
	Vbox.queue_sort()

func _on_add_button_down():
	var dt = {
		"idUser" : DataBase.idsession,
		"name" : " ",
		"desc": " ",
		"status" : 0
	}
	data.insert_row("habit", dt)
	get_tree().reload_current_scene()
