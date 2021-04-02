rendering
beginRendering: node

	self assert: (CMFReact isValidNode: node).
	
	currentRenderElement := node.
	hookIndex := 1