extends CharacterBody2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

const speed = 300
const jump_velo = -400
const gravity = 480

func _physics_process(delta):
		pass
		
		#detect input
		#store variable
		var horizontal
		var vertical
		
		#logic
		horizontal=Input.get_axis("LeftMove","RightMove")
		vertical=Input.get_axis("UpMove","DownMove")
	
		#gravity
		if not is_on_floor():
			velocity.y += gravity *delta
		#jump
		if Input.is_action_just_pressed("ui_accept") and is_on_floor():
			velocity.y = jump_velo
		
		#jump nanimatiion
		if Input.is_action_just_pressed("ui_accept"):
			animated_sprite_2d.play("jump")
	
		#animation horizontal
		if horizontal || vertical:
			animated_sprite_2d.play("run")
		else:
			animated_sprite_2d.play("idle")
			
		#flipping
		if horizontal >0:
			animated_sprite_2d.flip_h = true
		else:
			animated_sprite_2d.flip_h=false
			
		
		
		
		#apply velocity
		velocity.x = horizontal * 500
		velocity.y = vertical * 500
		
	
		#move
		move_and_slide()
		
