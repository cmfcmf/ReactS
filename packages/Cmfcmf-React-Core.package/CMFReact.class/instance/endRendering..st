rendering
endRendering: node

	self assert: (CMFReact isValidNode: node).
	
	hookIndex := nil