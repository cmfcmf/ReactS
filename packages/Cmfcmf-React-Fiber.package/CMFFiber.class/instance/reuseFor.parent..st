reconciliation
reuseFor: aNode parent: aFiber

	self alternate ifNil: [self alternate: (CMFFiber new alternate: self)].
	
	^ self alternate
		sibling: nil;
		index: 1;
		node: aNode;
		output: self output;
		parent: aFiber