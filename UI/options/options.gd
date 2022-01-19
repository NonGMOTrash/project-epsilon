extends Control

onready var sound_player = $sound_player
onready var tabs = $tabs
onready var fullscreen = $tabs/video/VBox/fullscreen
onready var pixel = $tabs/video/VBox/pixel
onready var vsync = $tabs/video/VBox/vsync
onready var perfection = $tabs/game/VBox/perfection
onready var smooth = $tabs/game/VBox/smooth
onready var hidebar = $tabs/game/VBox/hidebar
onready var master_volume = $tabs/audio/VBox/master_volume
onready var particles = $tabs/video/VBox/particles/dropdown
onready var gpu_snap = $tabs/video/VBox/gpu_snap
onready var spawn_pause = $tabs/game/VBox/spawn_pause
onready var lighting = $tabs/video/VBox/lighting
onready var combine_lights = $tabs/video/VBox/combine_lights
onready var shadows = $tabs/video/VBox/shadows
onready var shadow_buffer = $tabs/video/VBox/shadow_buffer
onready var ambient_lighting = $tabs/video/VBox/ambient_lighting

signal closed

func _ready() -> void:
	visible = false

func multi_color_set(target:Control, color:Color):
	target.set_deferred("custom_colors/font_color", color)
	target.set_deferred("custom_colors/font_color_pressed", color)
	target.set_deferred("custom_colors/font_color_hover", color)

func _on_tabs_visibility_changed() -> void:
	smooth.pressed = global.settings["smooth_camera"]
	hidebar.pressed = global.settings["hide_bar"]
	fullscreen.pressed = global.settings["fullscreen"]
	perfection.pressed = global.settings["perfection_mode"]
	pixel.pressed = global.settings["pixel_perfect"]
	master_volume.value = global.settings["volume"] * 100
	vsync.pressed = global.settings["vsync"]
	particles.selected = global.settings["particles"]
	spawn_pause.pressed = global.settings["spawn_pause"]
	lighting.pressed = global.settings["lighting"]
	combine_lights.pressed = global.settings["combine_lights"]
	shadows.pressed = global.settings["shadows"]
	shadow_buffer.value = global.settings["shadow_buffer"]
	ambient_lighting.pressed = global.settings["ambient_lighting"]
	
	if visible == false: return
	tabs.current_tab = 0
	smooth.grab_focus()

func _on_volume_value_changed(value: float) -> void:
	master_volume.label.text = "Volume ("+str(value)+"%)"
	# PROBLEM_NOTE: maybe make a smart_slider that does the above line automatically
	# maybe it could also use a texture progress somehow to look a little nicer
	AudioServer.set_bus_volume_db(0, linear2db(value/100))

func _on_exit_pressed() -> void:
	global.settings["smooth_camera"] = smooth.pressed
	global.settings["hide_bar"] = hidebar.pressed
	global.settings["fullscreen"] = fullscreen.pressed
	global.settings["perfection_mode"] = perfection.pressed
	global.settings["pixel_perfect"] = pixel.pressed
	global.settings["volume"] = master_volume.value / 100
	global.settings["vsync"] = vsync.pressed
	global.settings["particles"] = particles.selected
	global.settings["gpu_snap"] = gpu_snap.pressed
	global.settings["spawn_pause"] = spawn_pause.pressed
	global.settings["lighting"] = lighting.pressed
	global.settings["combine_lights"] = combine_lights.pressed
	global.settings["shadows"] = shadows.pressed
	global.settings["shadow_buffer"] = shadow_buffer.value
	global.settings["ambient_lighting"] = ambient_lighting.pressed
	
	global.update_settings()
	
	visible = false
	emit_signal("closed")

func _on_tabs_tab_changed(tab: int) -> void:
	sound_player.create_sound(smooth.click_sound, true, Sound.MODES.ONESHOT, true, true)
