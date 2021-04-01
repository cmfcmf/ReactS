rendering
renderNode: nodeOrStringOrNumber
	
	| node |
	node := nodeOrStringOrNumber asCMFReactNode.
		
	^ elementTree renderingWithChildren: node during: [:lastRenderResult |
		| result |
		self beginRendering: node. "for hooks"
		result :=  [node render: self lastRenderResult: lastRenderResult] ensure: [
			self endRendering: node "for hooks"
		].
		self assert: (self class isValidRenderResult: result).
		result]