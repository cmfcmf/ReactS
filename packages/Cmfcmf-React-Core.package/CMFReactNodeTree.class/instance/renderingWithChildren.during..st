rendering
renderingWithChildren: node during: aBlock

	| result |
	self resetCurrentParentEntryAndChildIndexAfter: [| currentEntry renderInfo |
		currentEntry := self currentEntryOrNil.
		renderInfo := CMFReactRenderInfo from: currentEntry.
		true caseOf: {
			[currentEntry isNil] -> [
				"not old node exists. Append the new node as a new child."
				"Transcript showln: 'throwing away old node (missing)'."
				renderInfo reusingOldNodes: false.
				currentParentEntry := currentParentEntry addChildNodeToTree: node].
			[currentEntry nodeType ~= node type] -> [
				"an old node exists, but has a different node type. Replace the old node."
				"Transcript showln: 'throwing away old node (type changed from ', currentEntry nodeType, ' to ', node type, ')'."
				renderInfo reusingOldNodes: false.
				currentParentEntry := currentParentEntry replaceChildTreeNodeAt: currentChildIndex with: node]}
			otherwise: [
				"an old node exists, and has the same node type. Re-use the old node."
				"Transcript showln: 'keeping old node'."
				renderInfo reusingOldNodes: true.
				currentParentEntry := currentEntry
					node: node;
					yourself].
		.
		"in any case, set the currentChildIndex to 1, since we changed the parent to the newly inserted node."
		currentChildIndex := 1.
		
		"now render the new node, and pass it the old node"
		self flag: #todo.
		currentParentEntry renderResult: (result := aBlock value: renderInfo)].
	
	"Now that this node and its children have rendered, and the currentParentNode and currentChildIndex have been reset, increment the currentChildIndex"
	currentChildIndex := currentChildIndex + 1.
	^ result