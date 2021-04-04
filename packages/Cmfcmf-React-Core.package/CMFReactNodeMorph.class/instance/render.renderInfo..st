rendering
render: react renderInfo: renderInfo

	| newMorph |	
	renderInfo reusingOldNodes
		ifFalse: [
			newMorph := createBlock ifNil: [morphClass new] ifNotNil: [createBlock value: morphClass].
			onRenderBlock value: newMorph.
			children ifNotNil: [| newChildren |
				newChildren := children ifNotNil: [react renderNodes: children].
				childrenMorphsBlock 
					ifNil: [newMorph addAllMorphs: newChildren] 
					ifNotNil: [childrenMorphsBlock value: newMorph value: newChildren]]]
		ifTrue: [
			newMorph := renderInfo oldRenderResult.
			self assert: newMorph class == morphClass.
			onRenderBlock value: newMorph.
			children ifNotNil: [| newChildren |
				newChildren := children ifNotNil: [react renderNodes: children].
				childrenMorphsBlock
					ifNil: [newMorph removeAllMorphs; addAllMorphs: newChildren]
					ifNotNil: [childrenMorphsBlock value: newMorph value: newChildren]]].
	^ newMorph