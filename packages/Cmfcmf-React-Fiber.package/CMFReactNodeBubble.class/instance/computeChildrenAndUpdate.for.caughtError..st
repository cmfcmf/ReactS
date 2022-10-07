as yet unclassified
computeChildrenAndUpdate: aFiber for: aState caughtError: anErrorOrNil

	aFiber output ifNil: [aFiber output: (aState hostConfig create: self)].
	^ self children