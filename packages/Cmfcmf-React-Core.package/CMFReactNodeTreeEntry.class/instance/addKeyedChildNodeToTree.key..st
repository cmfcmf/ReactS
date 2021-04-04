public
addKeyedChildNodeToTree: node key: key

	self assert: (node isKindOf: CMFReactNode).

	self assert: (keyedChildrenTreeNodes includesKey: key) not.
	^ keyedChildrenTreeNodes at: key put: (CMFReactNodeTreeEntry new
		node: node;
		parent: self;
		key: key;
		yourself)