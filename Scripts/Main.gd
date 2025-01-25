extends Node2D

@export var pipe_scene: PackedScene  # Cena dos obstáculos (tubos)
@export var pipe_spawn_time: float = 2.0  # Intervalo entre o spawn de tubos
@export var pipe_start_x: float = 1400.0  # Posição inicial dos tubos
@export var pipe_y_range: Vector2 = Vector2(-40, 250)  # Intervalo para a posição Y dos tubos

var pipe_timer: Timer  # Timer para controlar o spawn de obstáculos

func _ready():
	# Cria e configura o Timer
	pipe_timer = Timer.new()
	pipe_timer.wait_time = pipe_spawn_time  # Intervalo entre os tubos
	pipe_timer.one_shot = false  # O timer não é de uma única execução
	add_child(pipe_timer)
	pipe_timer.start()

	# Conecta o sinal "timeout" ao método "_spawn_pipe" para instanciar os tubos
	pipe_timer.connect("timeout", Callable(self, "_spawn_pipe"))

func _spawn_pipe():
	# Instancia o tubo
	var pipe_instance = pipe_scene.instantiate()
	
	# Define a posição Y do tubo dentro do intervalo especificado
	pipe_instance.position = Vector2(pipe_start_x, randf_range(pipe_y_range.x, pipe_y_range.y))

	# Adiciona o tubo na cena
	add_child(pipe_instance)
