rendering
endRendering: node

	self assert: (CMFReact isValidNode: node).
		
	currentRenderElement := nil.
	hookIndex := nil