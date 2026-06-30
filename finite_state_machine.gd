@abstract
class_name FiniteStateMachine
extends Node


signal state_changed


## The Node being controlled by this FSM. By default it is the FSM's parent.
@export var actor: Node
@export var initial_state: BaseState


var _states: Dictionary[StringName, BaseState]
var _current_state: BaseState


func _ready() -> void:
	if get_child_count() == 0:
		queue_free()
		return

	if actor == null:
		actor = get_parent()
	
	for child in get_children() as Array[BaseState]:
		_states[child.name] = child
		child.machine = self
		child.actor = actor
	
	if not actor.is_node_ready():
		await actor.ready
	
	if initial_state:
		change_state(initial_state.name)
	else:
		change_state(get_child(0).name)


func change_state(state_name: StringName) -> void:
	if _current_state:
		_current_state.exit()
	
	_current_state = _states[state_name]
	state_changed.emit()
	_current_state.enter()


func process(delta: float) -> void:
	_current_state.process(delta)


func physics_process(delta: float) -> void:
	_current_state.physics_process(delta)


func get_state() -> BaseState:
	return _current_state


func get_state_name() -> StringName:
	if _current_state:
		return _current_state.name
	else:
		return &""
