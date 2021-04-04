rendering
render: react renderInfo: renderInfo

	self assert: elementClass notNil. "elementClass is the contextClass"
	^ react renderNodes: (props at: #children)