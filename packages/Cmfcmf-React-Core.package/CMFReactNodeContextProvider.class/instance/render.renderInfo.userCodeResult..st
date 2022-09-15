rendering
render: react renderInfo: renderInfo userCodeResult: userCodeResult

	self assert: elementClass notNil. "elementClass is the contextClass"
	^ react renderNodes: (props at: #children)