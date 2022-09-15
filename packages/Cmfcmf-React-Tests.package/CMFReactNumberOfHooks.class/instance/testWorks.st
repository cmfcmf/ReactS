as yet unclassified
testWorks

	| btn |
	btn := self subject findByName: 'next'.
	
	self should: [btn click] raise: AssertionFailure description: 'The number of hooks in a component may not change between re-renders'