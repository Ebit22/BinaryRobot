extends Control

@onready var edit = $VBoxContainer/LineEdit
@onready var label = $VBoxContainer/RichTextLabel
var memory: Array[String] = ["0", "1"]
var text: Array[String] = [""">
>
>
>You are a robot
>This is the 'Brain' from the robot
>You can only type 0 or 1
>On your way you will find more complex codes
>BUT...
>Your system needs to update everytime you use a new code
>The longer the code the longer it updates
>Now you can start:
>\tType 1
"""]
const MAX_LINES := 75

func log_message(msg: String):
	text.insert(0, msg)
	if text.size() > MAX_LINES:
		text.pop_back()
	label.text = "\n".join(text)

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		if not str(edit.text) in memory:
			$"../../CanvasLayer".show()
			get_tree().paused = true
			await get_tree().create_timer(str(edit.text).length()*0.5).timeout
			_on_input_submitted("Updated("+str(edit.text)+")")
			get_tree().paused = false
			memory.append(str(edit.text))
			$"../../CanvasLayer".hide()
			Brain.input = edit.text
			print(Brain.input)
			edit.text = ""
		else:
			Brain.input = edit.text
			print(Brain.input)
			_on_input_submitted(edit.text)
			edit.text = ""

func _on_input_submitted(text):
	log_message("> " + text)
