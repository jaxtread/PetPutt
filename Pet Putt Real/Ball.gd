extends RigidBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	self.bounce = 0.8
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	self.look_at(get_global_mouse_position())
	
	if Input.is_action_just_pressed("launch_ball") and linear_velocity.length()<10:
		
		var differenceVector = self.position - get_global_mouse_position()
		var directionVector = differenceVector.normalized()
		var speed = 1200
		var launchVector = directionVector * speed
		self.linear_velocity = launchVector
	pass

func body_entered(otherBody):
		if otherBody.name == "Sword":
			go.destroy(self)
			global.isGameOver = true
		pass
