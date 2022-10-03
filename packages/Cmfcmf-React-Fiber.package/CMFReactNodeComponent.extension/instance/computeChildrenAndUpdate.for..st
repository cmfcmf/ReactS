*Cmfcmf-React-Fiber
computeChildrenAndUpdate: aFiber for: aState

	| method |
	method := (elementClass whichClassIncludesSelector: selector) >> selector.
	^ elementClass basicNew withArgs: {props} executeMethod: method