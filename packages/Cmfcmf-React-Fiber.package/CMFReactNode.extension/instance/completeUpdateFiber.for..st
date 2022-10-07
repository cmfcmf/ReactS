*Cmfcmf-React-Fiber
completeUpdateFiber: aFiber for: aState

	(aFiber alternate notNil and: [aFiber node isHostComponent and: [aFiber alternate node isHostComponent]]) ifTrue: [
		(aState hostConfig
			prepareUpdateFrom: aFiber alternate node
			to: aFiber node
			for: aFiber output) ifNotNil: [:hostUpdate | aFiber addChange: (CMFChangeUpdate new hostUpdate: hostUpdate)]]