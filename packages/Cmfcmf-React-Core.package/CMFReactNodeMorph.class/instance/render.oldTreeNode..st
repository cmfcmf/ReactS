rendering
render: react oldTreeNode: oldTreeNode

	| newMorph |	
	oldTreeNode
		ifNil: [
			newMorph := createBlock value.
			initBlock value: newMorph.
			children ifNotNil: [| newChildren |
				newChildren := children ifNotNil: [react renderNodes: children].
				childrenMorphsBlock 
					ifNil: [newMorph addAllMorphs: newChildren] 
					ifNotNil: [childrenMorphsBlock value: newMorph value: newChildren]]]
		ifNotNil: [
			newMorph := oldTreeNode renderResult.
			initBlock value: newMorph.
			children ifNotNil: [| newChildren |
				newChildren := children ifNotNil: [react renderNodes: children].
				childrenMorphsBlock
					ifNil: [newMorph removeAllMorphs; addAllMorphs: newChildren]
					ifNotNil: [childrenMorphsBlock value: newMorph value: newChildren]]].
	^ newMorph