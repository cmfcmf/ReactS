*Cmfcmf-React-Fiber
computeChildrenAndUpdate: aFiber for: aState

	aFiber output ifNil: [aFiber output: (aState hostConfig create: self)].
	^ self children