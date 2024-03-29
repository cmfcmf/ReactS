as yet unclassified
createNodeTreeAndReturnNextFor: aState caughtError: anErrorOrNil

	| nextFiber |
	[self node updateFiber: self for: aState caughtError: anErrorOrNil]
		on: CMFReactHooksChanged
		do: [:err |
			aState codeReload ifFalse: [^ err signal].
			self assert: err renderInfo = self.
			self alternate resetHooks.
			^ self].
	
	self node completeUpdateFiber: self for: aState.
	
	self child ifNotNil: [^ self child].
	
	nextFiber := self.
	[nextFiber] whileNotNil: [
		nextFiber sibling ifNotNil: [^ nextFiber sibling].
		nextFiber := nextFiber parent].
	
	^ nil