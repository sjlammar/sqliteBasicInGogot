extends Control
@onready var data = DataBase.database
@onready var id = DataBase.idnow
@onready var nama = $LineEdit
@onready var option = $HBoxContainer/OptionButton

# Called when the node enters the scene tree for the first time.
func _ready():
	option.add_item("pilih habit", 0)
	option.add_item("habit positif", 1)
	option.add_item("habit negatif", 2)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_hapus_button_down():
	var delete_query = "DELETE FROM habit WHERE id =  " + str(id)
	data.query(delete_query)
 
	var reset_query = "
		DELETE FROM sqlite_sequence WHERE name='habit';
	" 
	data.query(reset_query)
	get_tree().change_scene_to_file("res://Habit/habit_page.tscn")


func _on_back_button_down():
	get_tree().change_scene_to_file("res://Habit/habit_page.tscn")


func _on_update_button_down():
	var itemid = option.get_selected_id()
	if itemid > 0 :
		data.update_rows("habit", "id = '"+str(id)+"'",{"tipe" : itemid,"name" : nama.text} )
		get_tree().change_scene_to_file("res://Habit/habit_page.tscn")
