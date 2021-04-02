as yet unclassified
initEffect: effect_ dependencies: dependencies_

	effect := effect_.
	dependencies := dependencies_.
	hasRun := false.
	self assert: ("dependencies isNil"false or: [dependencies isEmpty]) description: 'not yet supported'