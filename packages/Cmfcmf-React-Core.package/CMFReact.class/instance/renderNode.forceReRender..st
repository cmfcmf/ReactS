rendering
renderNode: nodeOrStringOrNumber forceReRender: forceReRender
	
	| node |
	node := nodeOrStringOrNumber asCMFReactNode.
		
	^ elementTree renderingWithChildren: node during: [:renderInfo |
		| numHooks renderResult userCodeResult |
		renderInfo forceReRender: forceReRender.
		
		"start user code processing"
		self
			beginRunningRenderCode: node 
			withMaxNumHooks: (renderInfo oldNumHooks ifNil: [Float infinity]).
		
		userCodeResult := node executeUserCode: self renderInfo: renderInfo.
		
		numHooks := self afterRunningRenderCode: node.
		userCodeResult == #memoize ifTrue: [
			self assert: renderInfo oldNumHooks notNil.
			numHooks := renderInfo oldNumHooks].
		renderInfo reusingOldNodes ifTrue: [
			self assert: renderInfo oldNumHooks == numHooks description: 'The number of hooks in a component may not change between re-renders.'].
		"end user code processing"
		
		renderResult := node render: self renderInfo: renderInfo userCodeResult: userCodeResult.
		self assert: (self class isValidRenderResult: renderResult).
		
		"remove hooks of components that are no longer rendered."
		self flag: #todo. "This seems highly inefficient."
		hooks keysAndValuesRemove: [:nodeId :nodeHooks |
			(nodeId beginsWith: elementTree currentParentId) ifTrue: [nodeHooks removeAllSuchThat: [:hook | | treeNode |
				treeNode := elementTree rootEntry findTreeNodeById: nodeId.
				"remove if a) the component no longer exists or b) its type has changed to a component that does not support hooks"
				self flag: #todo. "Do we also need to remove the hook if it is still a component but its class has changed?"
				treeNode isNil or: [(treeNode node isKindOf: CMFReactNodeComponent) not]]].
			nodeHooks isEmpty].
		
		{renderResult. numHooks}]