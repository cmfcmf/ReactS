rendering
renderNode: nodeOrStringOrNumber
	
	| node |
	node := nodeOrStringOrNumber asCMFReactNode.
		
	^ elementTree renderingWithChildren: node during: [:lastRenderResult |
		| result |
		self beginRendering: node.
		result :=  [node render: self lastRenderResult: lastRenderResult] ensure: [self endRendering: node].
		self assert: (self class isValidRenderResult: result).
		result]