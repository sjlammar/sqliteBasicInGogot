extends Node2D
@onready var Vbox = $ScrollContainer/VBoxContainer
@onready var data = DataBase.database

var habitScene = preload("res://UI/daily.tscn")

func _ready():
	insertRow()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func insertRow():
	var nil = data.select_rows("habit_tipe", "habit_id == 0 OR habit_id > 0 ", ["*"])
	for row in nil :
		addHabit(row["habit_id"],row["tipe_id"])
	
func addHabit(idH, idT):
	var new_habit = habitScene.instantiate()
	new_habit.habitnow = idH
	new_habit.tipenow = idT
	Vbox.add_child(new_habit)
	Vbox.queue_sort()

func _on_add_button_down():
	var dt = {
		"habit_id" : 0,
		"tipe_id": 0,
		"status": ""
	}
	data.insert_row("habit_tipe", dt)
	get_tree().reload_current_scene()



func _on_reset_button_down():
	var delete_query = "DELETE FROM habit_tipe;"
	data.query(delete_query)
	get_tree().reload_current_scene()
