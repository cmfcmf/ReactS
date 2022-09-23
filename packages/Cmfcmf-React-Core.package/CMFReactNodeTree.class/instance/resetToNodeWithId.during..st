rendering
resetToNodeWithId: id during: aBlock

	^ self resetCurrentParentEntryAndChildPointerAfter: [ | treeNode |
		treeNode := rootEntry findTreeNodeById: id.
		self assert: treeNode notNil.
		
		currentParentEntry := treeNode parent.
		currentChildPointer := CMFReactChildPointer
			type: (treeNode isKeyed ifTrue: [#key] ifFalse: [#index])
			index: treeNode index
			key: (treeNode isKeyed ifTrue: [treeNode key] ifFalse: [nil]).
		
		aBlock value: treeNode]