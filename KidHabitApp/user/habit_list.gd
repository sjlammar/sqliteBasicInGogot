extends TextureRect
@onready var data = DataBase.database
var id : int
var nama = " "
var ket = " "
var cek = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$name.text = nama
	$desc.text = ket
	$CheckBox.button_pressed = cek


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_setting_button_down():
	if $name.editable :
		data.update_rows("habit", "id = '"+str(id)+"'",{"name" : $name.text,"desc" : $desc.text,"status": cek} )
		get_tree().reload_current_scene()
	$name.editable = not($name.editable)
	$desc.editable = not($desc.editable)
	$delete.visible = not($delete.visible)
	$CheckBox.disabled = not($CheckBox.disabled)



func _on_check_box_toggled(toggled_on):
	if toggled_on:
		cek =1
	else :
		cek = 0
