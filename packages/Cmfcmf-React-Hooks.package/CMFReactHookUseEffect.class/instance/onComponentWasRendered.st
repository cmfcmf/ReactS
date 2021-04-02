as yet unclassified
onComponentWasRendered

	mustRun ifTrue: [
		cleanup ifNotNil: [cleanup value].
		cleanup := effect value.
		self assert: (cleanup isNil or: [cleanup isBlock]).
		hasRun := true].
	
	mustRun := nil. "reset to something invalid so that we trigger an error if mustRun is accessed without calling updateDependencies"