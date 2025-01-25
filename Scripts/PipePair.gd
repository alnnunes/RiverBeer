extends Node2D

@export var move_speed: float = 200.0  # Velocidade de movimentação dos tubos

func _process(delta):
	# Move os tubos para a esquerda
	position.x -= move_speed * delta

	# Remove o tubo da cena quando ele sair da tela
	if position.x < -100:
		queue_free()
