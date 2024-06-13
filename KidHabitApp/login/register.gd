extends Control
@onready var nam = $VBoxContainer/user
@onready var pas = $VBoxContainer/pass
@onready var data = DataBase.database
@onready var deb = $VBoxContainer/debug
var us
var pa

# Called when the node enters the scene tree for the first time.
func _ready():
	deb.text =" "
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_reg_button_down():
	us = nam.text
	pa = pas.text
	var rows = data.select_rows("user","name = '%s'"%us,["*"])
	if rows.size() :
		deb.text ="username already exist"
	else :
		data.insert_row("user", {"name":us,"pass":pa})
		deb.text ="register successfull"


func _on_back_button_down():
	get_tree().change_scene_to_file("res://login/login.tscn")

