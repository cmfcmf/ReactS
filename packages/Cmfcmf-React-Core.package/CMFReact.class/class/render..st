as yet unclassified
render: rootElement

	self assert: (CMFReact isValidNode: rootElement).

	^ self new initAndRender: rootElement