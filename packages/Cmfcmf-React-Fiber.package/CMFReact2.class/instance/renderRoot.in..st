as yet unclassified
renderRoot: aNode in: aHostNode

	rootComponent := aNode.
	rootHostNode := aHostNode.
	currentRoot := CMFFiber new node: (CMFRootNode new
		child: rootComponent;
		root: rootHostNode).
	
	self reRenderAll