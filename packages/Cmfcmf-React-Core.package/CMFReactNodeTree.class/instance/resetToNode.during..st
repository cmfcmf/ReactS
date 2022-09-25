rendering
resetToNode: treeNode during: aBlock

	^ self resetCurrentParentEntryAndChildPointerAfter: [
		currentParentEntry := treeNode parent.
		currentChildPointer := CMFReactChildPointer
			type: (treeNode isKeyed ifTrue: [#key] ifFalse: [#index])
			index: treeNode index
			key: (treeNode isKeyed ifTrue: [treeNode key] ifFalse: [nil]).
		
		aBlock value: treeNode]