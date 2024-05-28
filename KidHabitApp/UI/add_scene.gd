extends Control
@onready var data = DataBase.database
@onready var Vbox = $ScrollContainer/VBoxContainer
var listH = preload("res://UI/list.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_back_button_down():
	get_tree().change_scene_to_file("res://Habit/habit_page.tscn")



func _on_add_h_button_down():
	if $habit.text :
		var dt = {
		"name" : $habit.text,
	}
		data.insert_row("habit", dt)
	$habit.text = ""
	

func insertRow(jen:String):
	var nil = data.select_rows(jen, "id > 0", ["*"])
	for row in nil :
		addHabit(row["name"],row["id"],jen)
	
func addHabit(Nm : String,i :int,j : String):
	var new_habit = listH.instantiate()
	new_habit.id = i
	new_habit.nama = Nm
	new_habit.jen = j
	Vbox.add_child(new_habit)
	Vbox.queue_sort()


func _on_show_h_button_down():
	for child in Vbox.get_children():
		Vbox.remove_child(child)
		child.queue_free()
	insertRow("habit")


func _on_add_2t_button_down():
	if $tipe.text :
		var dt = {
		"name" : $tipe.text,
	}
		data.insert_row("tipe", dt)
	$habit.text = ""


func _on_show_t_button_down():
	for child in Vbox.get_children():
		Vbox.remove_child(child)
		child.queue_free()
	insertRow("tipe")
