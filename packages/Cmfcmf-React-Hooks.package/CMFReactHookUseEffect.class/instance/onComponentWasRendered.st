as yet unclassified
onComponentWasRendered

	dependenciesChanged ifTrue: [
		cleanup ifNotNil: [cleanup value].
		cleanup := effect value.
		self assert: (cleanup isNil or: [cleanup isBlock])].
	
	"reset to something invalid so that we trigger an error if mustRun is accessed without calling updateDependencies"
	dependenciesChanged := nil. 