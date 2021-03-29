rendering
renderNode: nodeOrStringOrNumber
	
	| node |
	node := nodeOrStringOrNumber asCMFReactNode.
		
	^ elementTree renderingWithChildren: node during: [
		| result |
		self beginRendering: node.
		result :=  [node render: self] ensure: [self endRendering: node].
		self assert: (self class isValidRenderResult: result).
		result]