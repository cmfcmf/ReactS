*Cmfcmf-React-Fiber
computeChildrenAndUpdate: aFiber for: aState caughtError: anErrorOrNil

	^ anErrorOrNil
		ifNotNil: [fallback ifNotNil: [fallback value: anErrorOrNil]]
		ifNil: [children]