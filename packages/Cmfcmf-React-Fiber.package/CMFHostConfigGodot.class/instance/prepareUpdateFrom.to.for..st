reconciliation
prepareUpdateFrom: aNode to: anotherNode for: aHostNode

	^ (self diffPropsFrom: aNode to: anotherNode) ifNotNil: [:changes | changes select: [:val | val isGodotNode not]]