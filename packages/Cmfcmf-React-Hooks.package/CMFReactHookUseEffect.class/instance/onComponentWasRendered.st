as yet unclassified
onComponentWasRendered

	dependenciesChanged == true ifTrue: [
		cleanup ifNotNil: [cleanup value].
		cleanup := effect value.
		self assert: (cleanup isNil or: [cleanup isBlock])].
	
	"reset to something invalid so that we do not run again if the element containing the hook is not re-rendered"
	dependenciesChanged := nil. 