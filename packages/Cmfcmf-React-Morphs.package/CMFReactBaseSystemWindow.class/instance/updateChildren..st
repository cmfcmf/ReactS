as yet unclassified
updateChildren: aCollection

	children ifNil: [children := {}].
	self removeAllMorphsIn: children.
	children := aCollection.
	self addAllMorphs: children.
	children do: [:m| m hResizing: #spaceFill; vResizing: #spaceFill]