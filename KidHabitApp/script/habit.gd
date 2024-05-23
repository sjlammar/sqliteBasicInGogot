extends Control

@onready var Vbox = $habitList/VBoxContainer
@onready var data = DataBase.database

var habitScene = preload("res://scene/habit_action.tscn")
var poin = 0

func _ready():
	var table = {
		"id" :  {"data_type":"int", "primary_key" : true, "not_null" : true, "auto_increment" : true} ,
		"name" : {"data_type" : "text"},
		"poin" : {"data_type" : "int"}
	}
	data.create_table("habit", table)
	insertRow()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_add_button_down():
	get_tree().change_scene_to_file("res://scene/addHabit.tscn")
	insertRow()
	pass

func insertRow():
	var nil = data.select_rows("habit", "poin > 0", ["*"])
	for row in nil :
		addHabit(row["name"],row["poin"],row["id"])
	
func addHabit(Nm : String, Pn : int, i ):
	var new_habit = habitScene.instantiate()
	new_habit.Hbitname = Nm
	new_habit.value = Pn
	new_habit.id = i
	Vbox.add_child(new_habit)
	Vbox.queue_sort()
	
