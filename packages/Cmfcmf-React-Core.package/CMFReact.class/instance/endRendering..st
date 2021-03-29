rendering
endRendering: node

	self assert: (CMFReact isValidNode: node).
		
	currentRenderElement := nil.
	useStateHookIndex := nil.
	useEffectHookIndex := nil