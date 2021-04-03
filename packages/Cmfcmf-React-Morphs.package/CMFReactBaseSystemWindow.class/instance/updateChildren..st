as yet unclassified
updateChildren: aCollection

	children ifNil: [children := {}].
	self removeAllMorphsIn: children.
	children := aCollection.
	children withIndexDo: [:m :i |
		m layoutFrame ifNil: [
			m layoutFrame: (LayoutFrame fractions: (0@((i - 1) / children size) extent: 1@(1 / children size)))].
		m
			hResizing: #spaceFill; 
			vResizing: #spaceFill.
		self addMorph: m]