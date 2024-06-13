extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer/Username.text = "user  : "+ DataBase.session
	$VBoxContainer/role.text = "Role  : "+ DataBase.role


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_button_down():
	get_tree().change_scene_to_file("res://login/login.tscn")
