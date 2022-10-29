as yet unclassified
insert: aHostNode before: aSiblingHostNode in: aHostNodeParent fiber: aFiber

	(aHostNodeParent children includes: aHostNode) ifTrue: [aHostNodeParent children remove: aHostNode].
	
	aHostNodeParent children add: aHostNode before: aSiblingHostNode