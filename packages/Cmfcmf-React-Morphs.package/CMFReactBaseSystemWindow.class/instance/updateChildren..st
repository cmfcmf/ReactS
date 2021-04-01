as yet unclassified
updateChildren: aCollection

	children ifNil: [children := {}].
	self removeAllMorphsIn: children.
	children := aCollection.
	children do: [:m| 
		m
			layoutFrame: (LayoutFrame fractions: (0@0 extent: 1@1));
			hResizing: #spaceFill; 
			vResizing: #spaceFill.
		self addMorph: m]