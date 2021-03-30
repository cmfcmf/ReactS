as yet unclassified
render: react lastRenderResult: lastRenderResult

	| newMorph newChildren |
	newChildren := children ifNotNil: [react renderNodes: children].
	
	lastRenderResult
		ifNil: [
			newMorph := createBlock value.
			initBlock value: newMorph.
			children ifNotNil: [
				childrenMorphsBlock 
					ifNil: [newMorph addAllMorphs: newChildren] 
					ifNotNil: [childrenMorphsBlock value: newMorph value: newChildren]]]
		ifNotNil: [:oldMorph |
			newMorph := oldMorph.
			initBlock value: newMorph.
			children ifNotNil: [
				childrenMorphsBlock
					ifNil: [newMorph removeAllMorphs; addAllMorphs: newChildren]
					ifNotNil: [childrenMorphsBlock value: newMorph value: newChildren]]].
	^ newMorph