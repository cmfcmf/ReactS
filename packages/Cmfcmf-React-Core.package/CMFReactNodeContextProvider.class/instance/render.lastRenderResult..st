as yet unclassified
render: react lastRenderResult: lastRenderResult

	self assert: elementClass notNil.
	^ react renderNodes: (props at: #children)