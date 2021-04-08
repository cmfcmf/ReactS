as yet unclassified
set: updater

	| oldState |
	oldState := state.
	state := updater isBlock 
		ifTrue: [
			"do not allow nested hooks"
			CMFCurrentReact value: nil during: [updater value: oldState]] 
		ifFalse: [updater].
	state ~~ oldState ifTrue: onChange