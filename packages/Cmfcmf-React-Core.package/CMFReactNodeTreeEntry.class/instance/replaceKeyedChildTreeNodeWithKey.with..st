public
replaceKeyedChildTreeNodeWithKey: key with: node

	self assert: (node isKindOf: CMFReactNode).
	self assert: index <= childrenTreeNodes size.

	self assert: (keyedChildrenTreeNodes includesKey: key).
	^ keyedChildrenTreeNodes at: key put: (CMFReactNodeTreeEntry new
		node: node;
		parent: self;
		index: index;
		yourself)