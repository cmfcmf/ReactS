as yet unclassified
insert: aHostNode before: aSiblingHostNode in: aHostNodeParent

	(aHostNodeParent children includes: aHostNode) ifTrue: [aHostNodeParent children remove: aHostNode].
	
	aHostNodeParent children add: aHostNode before: aSiblingHostNode