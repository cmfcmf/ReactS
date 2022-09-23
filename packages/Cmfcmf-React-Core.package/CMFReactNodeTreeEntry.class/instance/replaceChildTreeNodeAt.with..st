public
replaceChildTreeNodeAt: index with: node

	self assert: (node isKindOf: CMFReactNode).
	self assert: index <= childrenTreeNodes size.
	
	(childrenTreeNodes at: index) onComponentWasDestroyed.
	^ childrenTreeNodes at: index put: (CMFReactNodeTreeEntry new
		node: node;
		parent: self;
		index: index;
		yourself)