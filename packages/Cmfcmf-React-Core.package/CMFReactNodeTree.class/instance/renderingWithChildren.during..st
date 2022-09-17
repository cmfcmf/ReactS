rendering
renderingWithChildren: node during: aBlock

	| renderResult isKeyed |
	isKeyed := node hasKey.
	self resetCurrentParentEntryAndChildPointerAfter: [ | currentEntry renderInfo numHooks renderResultAndNumHooks |
		isKeyed ifTrue: [
			currentChildPointer
				at: #key put: node key;
				at: #type put: #key].
		
		currentEntry := self currentEntryOrNil.
		renderInfo := CMFReactRenderInfo from: currentEntry.
		true
			caseOf: {
				[currentEntry isNil] -> [
					"no old node exists. Append the new node as a new child."
					renderInfo reusingOldNodes: false.
					currentParentEntry := self renderer addChild: node in: currentParentEntry].
				[currentEntry nodeType ~= node type] -> [
					"an old node exists, but has a different node type. Replace the old node."
					renderInfo reusingOldNodes: false.
					currentParentEntry := self renderer
						replaceChildAt: currentChildPointer index
						with: node
						in: currentParentEntry]}
			otherwise: [
				"an old node exists, and has the same node type. Re-use the old node."
				currentEntry index ~= currentChildPointer index ifTrue: [self renderer moveChild: currentEntry to: currentChildPointer index in: currentParentEntry].
				renderInfo reusingOldNodes: true.
				currentParentEntry := currentEntry
					node: node;
					index: currentChildPointer index;
					yourself].
		
		"in any case,  reset the currentChildPointer, since we changed the parent to the newly inserted node."
		currentChildPointer := JsonObject newFrom: {#type -> #index. #index -> 1. #key -> nil}.
		
		"now render the new node, and pass it the old node"
		renderResultAndNumHooks := aBlock value: renderInfo.
		renderResult := renderResultAndNumHooks first.
		numHooks := renderResultAndNumHooks second.
		
		self renderer deleteChildrenFrom: currentChildPointer index in: currentParentEntry.
		self assert: (self renderer class isValidRenderResult: renderResult).
		currentParentEntry renderResult: renderResult.
		currentParentEntry numHooks: numHooks].
	
	"Now that this node and its children have rendered, and the currentParentNode and currentChildIndex have been reset, increment the currentChildIndex"
	currentChildPointer := currentChildPointer copy
		index: currentChildPointer index + 1;
		yourself.
	^ renderResult