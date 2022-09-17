public
addChildNodeToTree: node

	self assert: node isCMFReactNode.
	
	"check for duplicate key?"
	self flag: #todo.
	
	^ childrenTreeNodes addLast: (CMFReactNodeTreeEntry new
		node: node;
		key: (node hasKey ifTrue: [node key] ifFalse: [nil]);
		parent: self;
		index: childrenTreeNodes size + 1;
		yourself)