as yet unclassified
insertOrAppend: aFiber before: aSiblingHostNode parent: aHostNodeParent for: aState

	aFiber output
		ifNotNil: [
			aSiblingHostNode
				ifNotNil: [aState hostConfig insert: aFiber output before: aSiblingHostNode in: aHostNodeParent]
				ifNil: [aState hostConfig appendChild: aFiber output in: aHostNodeParent].
			
			aFiber node ref ifNotNil: [aFiber node ref value: aFiber output]]
		ifNil: [
			"React can do this because they have separate passes for mounting and for reconciling. During mount, no side effects are tracked at all."
			"aFiber child ifNotNil: [:child | | sibling |
				self insertOrAppend: child before: aSiblingHostNode parent: aHostNodeParent for: aState.
				sibling := child sibling.
				[sibling] whileNotNil: [
					self insertOrAppend: sibling before: aSiblingHostNode parent: aHostNodeParent for: aState.
					sibling := sibling sibling]]"]