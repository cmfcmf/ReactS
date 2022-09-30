as yet unclassified
testWorks

	| btn |
	btn := self subject findByName: 'next'.
	
	self should: [btn click] raise: CMFReactHooksChanged