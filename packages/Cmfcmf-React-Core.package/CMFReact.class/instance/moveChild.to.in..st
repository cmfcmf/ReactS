reconciliation
moveChild: aNode to: anotherNumber in: aParentNode

	aParentNode childrenTreeNodes
		swap: (aParentNode childrenTreeNodes indexOf: aNode)
		with: anotherNumber