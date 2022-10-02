lifecycle
onComponentWasRendered
	"do not allow nested hooks"

	CMFCurrentReact value: nil during: [ | ret |
		"reset to something invalid so that we do not run again if the element containing the hook is not re-rendered"
		dependenciesChanged := nil.
		cleanup ifNotNil: [ | doClean |
			doClean := cleanup.
			cleanup := nil.
			doClean value].
		ret := effect value.
		ret isBlock ifTrue: [cleanup := ret]]