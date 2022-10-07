as yet unclassified
appendChild: aHostNode in: aParentHostNode

	(aParentHostNode children includes: aHostNode) ifTrue: [aParentHostNode children remove: aHostNode].
	
	aParentHostNode appendChild: aHostNode