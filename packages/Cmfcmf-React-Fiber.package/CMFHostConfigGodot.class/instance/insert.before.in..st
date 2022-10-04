reconciliation
insert: aHostNode before: aSiblingHostNode in: aParentHostNode

	| node |
	node := aHostNode.
	node at: 2 put: (self fullPathFor: aParentHostNode).
	aHostNode at: 1 put: #insert.
	
	aHostNode size = 6 ifTrue: [node := node copyWith: (self fullPathFor: aSiblingHostNode)] ifFalse: [aHostNode at: 7 put: (self fullPathFor: aSiblingHostNode)].
	
	pendingUpdates add: node