*Cmfcmf-React-Fiber
updateFiber: aFiber for: aState

	| children |
	aFiber resetHooks.
	children := aState
		componentRenderFor: aFiber
		do: [self computeChildrenAndUpdate: aFiber for: aState].
	children
		ifNotNil: [
			children isCollection ifFalse: [children := {children}].
			
			aFiber child: (aFiber reconcileChildren: (children select: [:child | child notNil]) for: aState)]
		ifNil: [
			aFiber child: nil.
			aFiber alternate ifNotNil: [aFiber alternate childrenDo: [:child | aFiber addChange: (CMFChangeChildDeletion new fiber: child)]]]