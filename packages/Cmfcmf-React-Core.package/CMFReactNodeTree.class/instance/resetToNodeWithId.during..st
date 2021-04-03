rendering
resetToNodeWithId: id during: aBlock

	^ self resetCurrentParentEntryAndChildIndexAfter: [| treeNode |
		treeNode := rootEntry findTreeNodeById: id.
		self assert: treeNode notNil.
	
		currentParentEntry := treeNode parent.
		currentChildIndex := treeNode index.

		aBlock value: treeNode]