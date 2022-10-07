as yet unclassified
doIn: aParentFiber for: aState

	fiber commitNodeChangesFor: aState.
	
	fiber node isHostComponent
		ifTrue: [aState hostConfig removeChild: fiber output in: aParentFiber nextHostParent output]
		ifFalse: [fiber hostChildrenDo: [:child | aState hostConfig removeChild: child output in: aParentFiber nextHostParent output]].
	
	fiber allFibersDo: [:child |
		"FIXME not so pretty that this is here"
		child node class = CMFReactNodePortal ifTrue: [child hostChildrenDo: [:c | aState hostConfig removeChild: c output in: child node container get]].
		child onComponentWasDestroyed]