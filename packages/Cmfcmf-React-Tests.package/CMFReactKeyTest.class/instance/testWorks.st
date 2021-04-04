as yet unclassified
testWorks

	| btn |
	btn := self subject findByName: 'btn'.
	
	self assert: (Dictionary newFrom: {#a -> 1. #b -> 1. #c -> 1}) equals: renderCounts.
	
	btn click.
	self assert: (Dictionary newFrom: {#a -> 1. #b -> 1. #c -> 1}) equals: renderCounts.
	
	btn click.
	self assert: (Dictionary newFrom: {#a -> 1. #b -> 1. #c -> 1}) equals: renderCounts.
	
	btn click.
	self assert: (Dictionary newFrom: {#a -> 1. #b -> 1. #c -> 1}) equals: renderCounts