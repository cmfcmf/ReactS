rendering
renderNode: nodeOrStringOrNumber
	
	| node |
	node := nodeOrStringOrNumber asCMFReactNode.
		
	^ elementTree renderingWithChildren: node during: [:oldTreeNode |
		| result |
		self beginRendering: node. "for hooks"
		result :=  [node render: self oldTreeNode: oldTreeNode] ensure: [
			self endRendering: node "for hooks"].
		self assert: (self class isValidRenderResult: result).
		result]