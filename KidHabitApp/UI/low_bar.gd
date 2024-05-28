extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_main_button_down():
	get_tree().change_scene_to_file("res://main.tscn")


func _on_habit_button_down():
	get_tree().change_scene_to_file("res://Habit/habit_page.tscn")


func _on_task_button_down():
	get_tree().change_scene_to_file("res://Task/task_scene.tscn")
