rendering
endRenderingNode: node

	self assert: (CMFReact isValidNode: node).
	
	hookIndex := nil