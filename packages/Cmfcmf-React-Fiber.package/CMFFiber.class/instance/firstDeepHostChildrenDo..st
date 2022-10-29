nil
firstDeepHostChildrenDo: aBlock

	self childrenDo: [:child |
		child node isHostComponent
			ifTrue: [aBlock value: child]
			ifFalse: [child firstDeepHostChildrenDo: aBlock]]