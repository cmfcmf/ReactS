rendering
beginRendering: node

	self assert: (CMFReact isValidNode: node).
	
	currentRenderElement := node.
	useStateHookIndex := 1.
	useEffectHookIndex := 1.