lifecycle
onComponentWasRendered
	"do not allow nested hooks"

	CMFCurrentReact value: nil during: [ | ret |
		cleanup ifNotNil: [cleanup value].
		ret := effect value.
		ret isBlock ifTrue: [cleanup := ret]].
	
	"reset to something invalid so that we do not run again if the element containing the hook is not re-rendered"
	dependenciesChanged := nil