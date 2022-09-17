lifecycle
onComponentWasRendered

	dependenciesChanged == true ifTrue: [
		"do not allow nested hooks"
		CMFCurrentReact value: nil during: [
			cleanup ifNotNil: [cleanup value].
			cleanup := effect value].
		self assert: (cleanup isNil or: [cleanup isBlock])].
	
	"reset to something invalid so that we do not run again if the element containing the hook is not re-rendered"
	dependenciesChanged := nil. 