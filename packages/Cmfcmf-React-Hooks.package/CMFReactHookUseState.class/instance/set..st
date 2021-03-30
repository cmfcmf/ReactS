as yet unclassified
set: updater

	| oldState |
	oldState := state.
	state := updater isBlock ifTrue: [updater cull: oldState] ifFalse: [updater].
	state ~~ oldState ifTrue: [onUpdate value]