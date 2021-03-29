as yet unclassified
run

	(dependencies isNil or: [hasRun isNil]) ifTrue: [
		cleanup ifNotNil: [cleanup value].
		cleanup := effect value].
	
	hasRun := true.