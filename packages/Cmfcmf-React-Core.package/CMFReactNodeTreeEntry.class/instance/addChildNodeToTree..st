public
addChildNodeToTree: node

	self assert: (node isKindOf: CMFReactNode).

	^ childrenTreeNodes addLast: (CMFReactNodeTreeEntry new
		node: node;
		parent: self;
		index: childrenTreeNodes size + 1;
		yourself)