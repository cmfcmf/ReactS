as yet unclassified
insertOrAppend: aFiber before: aSiblingHostNode parent: aHostNodeParent for: aState

	aFiber output ifNotNil: [
		aSiblingHostNode
			ifNotNil: [aState hostConfig insert: aFiber output before: aSiblingHostNode in: aHostNodeParent fiber: aFiber]
			ifNil: [aState hostConfig appendChild: aFiber output in: aHostNodeParent fiber: aFiber].
		
		aFiber node ref ifNotNil: [aFiber node ref value: aFiber output]]