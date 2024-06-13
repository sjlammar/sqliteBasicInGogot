extends Control
@onready var data = DataBase.database
@onready var Vbox = $ScrollContainer/VBoxContainer
var taskScene = preload("res://admin/stat_admin.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	insertRow()


func insertRow():
	var query = "SELECT status.name, status.jumlah, user.name AS user_name
FROM status
JOIN user ON user.id = status.idUser;"
	data.query(query)
	var user = data.query_result
	for row in user :
		addHabit(row["user_name"],row["name"],row["jumlah"])
	
func addHabit(Nm : String, hb : String, ts :String):
	var new_habit = taskScene.instantiate()
	new_habit.nam = Nm
	new_habit.ts = ts
	new_habit.hb = hb
	Vbox.add_child(new_habit)
	Vbox.queue_sort()

func _on_button_button_down():
	get_tree().reload_current_scene()


