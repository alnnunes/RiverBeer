extends CharacterBody2D

@export var gravity: float = 500.0  # Intensidade da gravidade
@export var jump_force: float = -300.0  # Força do pulo para cima

# No Godot 4.3, a variável 'velocity' já existe, então não precisamos declarar
# Não declaremos 'var velocity', usaremos a 'velocity' interna do CharacterBody2D

func _ready():
	# Inicializa qualquer coisa necessária no início, como animações
	pass

func _physics_process(delta):
	# Aplica a gravidade
	velocity.y += gravity * delta

	# Verifica se o jogador pressionou a tecla de pulo (Space ou Enter, configurado no Input Map)
	if Input.is_action_just_pressed("ui_accept"):
		velocity.y = jump_force

	# Move o corpo com a função integrada de CharacterBody2D
	move_and_slide()
