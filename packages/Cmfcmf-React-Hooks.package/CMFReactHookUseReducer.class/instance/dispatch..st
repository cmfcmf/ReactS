public
dispatch: anAction

	| oldState |
	oldState := state.
	"do not allow nested hooks"
	state := CMFCurrentReact value: nil during: [reducer value: state value: anAction].
	state ~~ oldState ifTrue: [onChange cull: self]