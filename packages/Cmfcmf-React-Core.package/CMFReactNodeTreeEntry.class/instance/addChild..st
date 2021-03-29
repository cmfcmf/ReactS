as yet unclassified
addChild: node

	self assert: (node isKindOf: CMFReactNode).

	^ childNodes addLast: (CMFReactNodeTreeEntry new
		node: node;
		parent: self;
		index: childNodes size + 1;
		yourself)