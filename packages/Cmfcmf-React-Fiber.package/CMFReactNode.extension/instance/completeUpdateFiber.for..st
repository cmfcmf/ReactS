*Cmfcmf-React-Fiber
completeUpdateFiber: aFiber for: aState

	(aFiber alternate notNil and: [aFiber node isHostComponent and: [aFiber alternate node isHostComponent]]) ifTrue: [
		(aState hostConfig
			prepareUpdateFrom: aFiber alternate node
			to: aFiber node
			for: aFiber output) ifNotNil: [:hostUpdate | aFiber addChange: (CMFChangeUpdate new hostUpdate: hostUpdate)]].
	aFiber node ref == ((aFiber alternate ifNotNil: #node) ifNotNil: #ref) ifFalse: [aFiber addChange: CMFChangeUpdateRef new]