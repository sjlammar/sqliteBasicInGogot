extends Control 
@onready var nam = $VBoxContainer/user
@onready var pas = $VBoxContainer/pass
@onready var data = DataBase.database
@onready var deb = $VBoxContainer/debug
var us
var pa

func _ready():
	deb.text =" "
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(delta):
	pass

func _on_login_button_down():
	us = nam.text
	var rows = data.select_rows("user","name = '%s'"%us,["*"])
	if rows.size() :
		pa = pas.text
		var parow = data.select_rows("user","pass = '%s'"%pa,["*"])
		if parow.size():
			deb.text ="login succesfull"
			if pa == "admin":
				DataBase.session = "admin"
				DataBase.role = "admin"
				get_tree().change_scene_to_file("res://admin/admin_task.tscn")
			else :
				DataBase.idsession = rows[0]["id"]
				DataBase.session = rows[0]["name"]
				DataBase.role = "student"
				get_tree().change_scene_to_file("res://main.tscn")
		else :
			deb.text ="incorect password"
	else :
		deb.text ="username not found"


func _on_register_button_down():
	get_tree().change_scene_to_file("res://login/register.tscn")
