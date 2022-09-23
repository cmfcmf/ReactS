rendering
renderNode: nodeOrStringOrNumber forceReRender: forceReRender

	| node |
	node := nodeOrStringOrNumber asCMFReactNode.
	
	^ elementTree renderingWithChildren: node during: [:renderInfo | | numHooks renderResult userCodeResult |
		renderInfo forceReRender: forceReRender.
		"start user code processing"
		self beginRunningRenderCode: node withMaxNumHooks: (renderInfo oldNumHooks ifNil: [Float infinity]).
		
		userCodeResult := node executeUserCode: self renderInfo: renderInfo.
		
		numHooks := self afterRunningRenderCode: node.
		userCodeResult == #memoize ifTrue: [
			self assert: renderInfo oldNumHooks notNil.
			numHooks := renderInfo oldNumHooks].
		renderInfo reusingOldNodes ifTrue: [
			self
				assert: renderInfo oldNumHooks == numHooks
				description: 'The number of hooks in a component may not change between re-renders.'].
		"end user code processing"
		
		renderResult := node render: self renderInfo: renderInfo userCodeResult: userCodeResult.
		self assert: (self class isValidRenderResult: renderResult).
		
		renderResult]