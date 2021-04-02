as yet unclassified
set: updater

	| oldState |
	oldState := state.
	state := updater isBlock ifTrue: [updater value: oldState] ifFalse: [updater].
	state ~~ oldState ifTrue: onChange