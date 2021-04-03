rendering
render: react oldTreeNode: oldTreeNode

	| newMorph |	
	oldTreeNode
		ifNil: [
			newMorph := createBlock ifNil: [morphClass new] ifNotNil: [createBlock value: morphClass].
			onRenderBlock value: newMorph.
			children ifNotNil: [| newChildren |
				newChildren := children ifNotNil: [react renderNodes: children].
				childrenMorphsBlock 
					ifNil: [newMorph addAllMorphs: newChildren] 
					ifNotNil: [childrenMorphsBlock value: newMorph value: newChildren]]]
		ifNotNil: [
			newMorph := oldTreeNode renderResult.
			self assert: newMorph class == morphClass.
			onRenderBlock value: newMorph.
			children ifNotNil: [| newChildren |
				newChildren := children ifNotNil: [react renderNodes: children].
				childrenMorphsBlock
					ifNil: [newMorph removeAllMorphs; addAllMorphs: newChildren]
					ifNotNil: [childrenMorphsBlock value: newMorph value: newChildren]]].
	^ newMorph