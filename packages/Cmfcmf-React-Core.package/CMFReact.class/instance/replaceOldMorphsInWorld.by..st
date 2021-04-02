rendering
replaceOldMorphsInWorld: old by: new

	| oldMorphs newMorphs |
	oldMorphs := old asOrderedCollection.
	newMorphs := new asOrderedCollection.
	self assert: oldMorphs size == newMorphs size.
	
	oldMorphs with: newMorphs do: [:oldMorph :newMorph |
		oldMorph ~~ newMorph ifTrue: [| oldOwner |
			oldOwner := oldMorph owner.
			self assert: newMorph owner isNil.
			oldOwner
				ifNil: [oldMorph becomeForward: newMorph] 
				ifNotNil: [oldOwner replaceSubmorph: oldMorph by: newMorph]]]