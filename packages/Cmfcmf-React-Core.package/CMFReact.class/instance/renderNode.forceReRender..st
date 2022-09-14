rendering
renderNode: nodeOrStringOrNumber forceReRender: forceReRender
	
	| node |
	node := nodeOrStringOrNumber asCMFReactNode.
		
	^ elementTree renderingWithChildren: node during: [:renderInfo |
		| result |
		renderInfo forceReRender: forceReRender.
		self beginRenderingNode: node. "for hooks"
		result :=  [node render: self renderInfo: renderInfo] ensure: [
			self endRenderingNode: node "for hooks"].
		self assert: (self class isValidRenderResult: result).
		
		"remove hooks of components that are no longer rendered."
		self flag: #todo. "This seems highly inefficient."
		hooks keysAndValuesRemove: [:nodeId :nodeHooks |
			(nodeId beginsWith: elementTree currentParentId) ifTrue: [nodeHooks removeAllSuchThat: [:hook | | treeNode |
				treeNode := elementTree rootEntry findTreeNodeById: nodeId.
				"remove if a) the component no longer exists or b) its type has changed to a component that does not support hooks"
				self flag: #todo. "Do we also need to remove the hook if it is still a component but its class has changed?"
				treeNode isNil or: [(treeNode node isKindOf: CMFReactNodeComponent) not]]].
			nodeHooks isEmpty].
		
		result]