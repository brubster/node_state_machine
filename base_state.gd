@abstract
class_name BaseState
extends Node


## This state's Finite State Machine, a.k.a. its parent Node.
## Allows for states to tell the machine when/which state to change to.
var machine: FiniteStateMachine

## The Node being controlled by this FSM.
## Allows for states to directly access its properties and methods.
var actor: Node


func enter() -> void:
	pass


func exit() -> void:
	pass


func process(_delta: float) -> void:
	pass


func physics_process(_delta: float) -> void:
	pass


func unhandled_input(_event: InputEvent) -> void:
	pass
