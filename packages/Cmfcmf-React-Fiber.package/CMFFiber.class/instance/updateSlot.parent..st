reconciliation
updateSlot: aNode parent: aFiber

	aNode key ~= self key ifTrue: [^ nil].
	
	^ self node type = aNode type
		ifTrue: [self reuseFor: aNode parent: aFiber]
		ifFalse: [
			CMFFiber new
				node: aNode;
				parent: aFiber]