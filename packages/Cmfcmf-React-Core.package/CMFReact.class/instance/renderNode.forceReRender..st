rendering
renderNode: nodeOrStringOrNumber forceReRender: forceReRender

	| node |
	node := nodeOrStringOrNumber asCMFReactNode.
	
	^ elementTree renderingWithChildren: node during: [:renderInfo | | numHooks renderResult userCodeResult userCodeResultAndNumHooks |
		renderInfo forceReRender: forceReRender.
		userCodeResultAndNumHooks := self runRenderCode: node renderInfo: renderInfo.
		userCodeResult := userCodeResultAndNumHooks first.
		numHooks := userCodeResultAndNumHooks second.
		
		userCodeResult == #memoize ifTrue: [
			self assert: renderInfo oldNumHooks notNil.
			numHooks := renderInfo oldNumHooks].
		renderInfo reusingOldNodes ifTrue: [
			renderInfo oldNumHooks = numHooks ifFalse: [
				userCodeResult := (CMFReactHooksChanged new
					node: nodeOrStringOrNumber;
					renderInfo: renderInfo;
					signal) first]].
		
		renderResult := node render: self renderInfo: renderInfo userCodeResult: userCodeResult.
		self assert: (self class isValidRenderResult: renderResult).
		
		renderResult]