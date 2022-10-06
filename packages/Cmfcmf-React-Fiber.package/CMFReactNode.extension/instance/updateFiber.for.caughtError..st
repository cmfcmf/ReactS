*Cmfcmf-React-Fiber
updateFiber: aFiber for: aState caughtError: anErrorOrNil

	| children |
	aFiber prepareHooks.
	children := (aState
		componentRenderFor: aFiber
		do: [self computeChildrenAndUpdate: aFiber for: aState caughtError: anErrorOrNil]) ifNil: [#()].
	children ifNotNil: [ | newChild |
		children isCollection
			ifFalse: [children := {children}]
			ifTrue: [children := children flatten].
		newChild := aFiber reconcileChildren: (children select: [:child | child notNil]) for: aState.
		aFiber child: newChild]