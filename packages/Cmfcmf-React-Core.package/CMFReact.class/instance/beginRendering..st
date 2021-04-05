rendering
beginRendering: node

	self assert: (CMFReact isValidNode: node).
	
	hookIndex := 1