as yet unclassified
doIn: aParentFiber for: aState

	fiber commitNodeChangesFor: aState.
	
	fiber firstHostChild ifNotNil: [
		aState hostConfig
			removeChild: fiber firstHostChild output
			in: aParentFiber nextHostParent output].
	fiber allFibersDo: [:child | child onComponentWasDestroyed]