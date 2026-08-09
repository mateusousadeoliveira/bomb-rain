extends Label


@onready var valores = get_parent().get_parent().get_node("key_spawer")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	text = "keys: {collected}/{total}".format({"total": valores.total_keys, "collected": valores.collected_keys })
	if valores.collected_keys ==valores.total_keys:
		set("theme_override_colors/font_color",Color.YELLOW)
