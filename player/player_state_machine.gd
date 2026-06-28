class_name PlayerStateMachine
extends FiniteStateMachine


@export var player: Player


func _ready() -> void:
	super()
	
	if player == null:
		player = get_parent() as Player
	
	for child in get_children() as Array[BaseState]:
		if child is PlayerState:
			var c := child as PlayerState
			c.player = self.player
