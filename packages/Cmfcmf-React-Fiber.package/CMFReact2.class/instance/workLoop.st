as yet unclassified
workLoop

	[nextFiber notNil] whileTrue: [nextFiber := nextFiber createNodeTreeAndReturnNextFor: self].
	nextFiber ifNil: [self commitNodeChanges]