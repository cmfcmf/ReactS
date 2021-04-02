as yet unclassified
dispatch: anAction

	| oldState |
	oldState := state.
	state := reducer value: state value: anAction.
	state ~~ oldState ifTrue: onChange