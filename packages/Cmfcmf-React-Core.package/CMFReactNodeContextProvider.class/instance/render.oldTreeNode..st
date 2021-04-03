as yet unclassified
render: react oldTreeNode: oldTreeNode

	self assert: elementClass notNil. "elementClass is the contextClass"
	^ react renderNodes: (props at: #children)