*Cmfcmf-React-Fiber
updateFiber: aFiber for: aState

	| children |
	aFiber prepareHooks.
	children := (aState
		componentRenderFor: aFiber
		do: [self computeChildrenAndUpdate: aFiber for: aState]) ifNil: [#()].
	children ifNotNil: [ | newChild |
		children isCollection ifFalse: [children := {children}].
		newChild := aFiber reconcileChildren: (children select: [:child | child notNil]) for: aState.
		aFiber child: newChild]