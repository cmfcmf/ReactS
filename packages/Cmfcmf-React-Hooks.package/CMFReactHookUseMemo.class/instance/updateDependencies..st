as yet unclassified
updateDependencies: newDependencies

	super updateDependencies: newDependencies.
	dependenciesChanged ifTrue: [
		"reset to something invalid so that we trigger an error if mustRun is accessed without calling updateDependencies"
		dependenciesChanged := nil.
		value := block value]