as yet unclassified
insertOrAppend: aFiber before: aSiblingHostNode parent: aHostNodeParent for: aState

	aFiber output ifNotNil: [
		aSiblingHostNode
			ifNotNil: [aState hostConfig insert: aFiber output before: aSiblingHostNode in: aHostNodeParent]
			ifNil: [aState hostConfig appendChild: aFiber output in: aHostNodeParent].
		
		aFiber node ref ifNotNil: [aFiber node ref value: aFiber output]]