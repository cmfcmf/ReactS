*Cmfcmf-React-Fiber
updateFiber: aFiber for: aState

	(aFiber alternate notNil and: [
		(aState shouldIgnoreMemoized: aFiber alternate) not and: [self memoize and: [aFiber alternate node props cmfPropsEqualTo: aFiber node props]]]) ifTrue: [^ nil].
	^ super updateFiber: aFiber for: aState