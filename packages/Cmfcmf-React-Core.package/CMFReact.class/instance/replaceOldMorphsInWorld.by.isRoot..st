rendering
replaceOldMorphsInWorld: old by: new isRoot: isRoot

	| newMorphs |
	newMorphs := new asOrderedCollection.
	isRoot ifTrue: [newMorphs do: [:each | each cmfSetCorrespondingReactRoot: self]].
	
	old ifNotNil: [
		| oldMorphs |
	
		oldMorphs := old asOrderedCollection.
		self assert: oldMorphs size == newMorphs size.
	
		oldMorphs with: newMorphs do: [:oldMorph :newMorph |
			oldMorph ~~ newMorph ifTrue: [| oldOwner |
				oldOwner := oldMorph owner.
				self assert: newMorph owner isNil.
				oldOwner
					ifNil: [oldMorph becomeForward: newMorph] 
					ifNotNil: [oldOwner replaceSubmorph: oldMorph by: newMorph]]]].
		
	isRoot ifTrue: [renderResult := new].