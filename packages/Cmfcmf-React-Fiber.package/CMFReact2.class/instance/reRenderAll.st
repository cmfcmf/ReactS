as yet unclassified
reRenderAll

	| rootNode |
	rootNode := CMFRootNode new
		child: rootComponent;
		root: rootHostNode.
	workInProgressRoot := currentRoot
		ifNotNil: [currentRoot reuseFor: rootNode parent: nil]
		ifNil: [CMFFiber new node: rootNode].
	
	nextFiber := workInProgressRoot.
	
	self updateFrameDo: [self workLoop]