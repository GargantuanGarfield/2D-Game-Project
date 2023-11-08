extends Node

export(PackedScene) var mob_scene
var score

func _ready():
	$Deathscreen.hide()
	randomize()

func new_game():
	score = 0
	$Deathscreen.hide()
	$Music.play()
	$Player.start($StartPOSITION.position)
	$STARTTIMER.start()
	$HUD.update_score(score)
	$HUD.show_message("Watch YOurself!")

func _on_SCORETIMER_timeout():
	score += 1
	$HUD.update_score(score)


func _on_STARTTIMER_timeout():
	$MOBTIMER.start()
	$SCORETIMER.start()


func _on_MOBTIMER_timeout():
	var mob = mob_scene.instance()
	var MOBsparnloc = get_node("MOBPARTH/MOBsparnloc")
	MOBsparnloc.offset = randi()
	var direction = MOBsparnloc.rotation + PI / 2
	mob.position = MOBsparnloc.position
	direction += rand_range(-PI / 4, PI/ 4)
	mob.rotation = direction
	var velocity = Vector2(rand_range(150.0, 250.0), 0.0)
	mob.linear_velocity = velocity.rotated(direction)
	add_child(mob)

func game_over():
	$Deathscreen.show()
	$SCORETIMER.stop()
	$MOBTIMER.stop()
	$HUD.show_game_over()
	$Music.stop()
	$youparasite.play()
