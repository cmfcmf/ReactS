rendering
renderNode: nodeOrStringOrNumber forceReRender: forceReRender
	
	| node |
	node := nodeOrStringOrNumber asCMFReactNode.
		
	^ elementTree renderingWithChildren: node during: [:renderInfo |
		| result |
		renderInfo forceReRender: forceReRender.
		self beginRendering: node. "for hooks"
		result :=  [node render: self renderInfo: renderInfo] ensure: [
			self endRendering: node "for hooks"].
		self assert: (self class isValidRenderResult: result).
		result]