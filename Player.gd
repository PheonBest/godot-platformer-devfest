extends CharacterBody2D

@onready var Animator = $AnimatedSprite2D

var jumpForce = -450
var speed = 400
var gravity = 9

var isLookingRight = true

func _process(delta):
	PlayerMovement()
	PlayerAnimation()

func PlayerAnimation():
	if velocity.x > 0 and !isLookingRight:
		Animator.flip_h = !Animator.flip_h
		isLookingRight = !isLookingRight
	elif velocity.x < 0 and isLookingRight:
		Animator.flip_h = !Animator.flip_h
		isLookingRight = !isLookingRight
	
	if velocity.x != 0:
		Animator.play("run")
	elif velocity.x == 0:
		Animator.play("idle")
	if velocity.y < 0:
		Animator.play("jump")
	elif velocity.y > 0:
		Animator.play("fall")
	
func PlayerMovement():
	var direction = 0
	if Input.is_action_pressed("right"):
		direction = 1
	if Input.is_action_pressed("left"):
		direction = -1
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y += jumpForce
		
	if !is_on_floor():
		velocity.y += gravity
	
	velocity.x = direction * speed
	
	move_and_slide()
