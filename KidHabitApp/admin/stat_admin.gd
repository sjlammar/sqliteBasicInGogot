extends TextureRect
var nam:String
var hb:String
var ts:String
# Called when the node enters the scene tree for the first time.
func _ready():
	$name.text = nam
	$habit.text = hb
	$task.text = ts
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
