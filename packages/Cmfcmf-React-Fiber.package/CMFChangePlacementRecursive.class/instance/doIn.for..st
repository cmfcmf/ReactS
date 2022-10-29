as yet unclassified
doIn: aFiber for: aState

	aFiber node isHostComponent
		ifTrue: [super doIn: aFiber for: aState]
		ifFalse: [aFiber firstDeepHostChildrenDo: [:f | super doIn: f for: aState]]