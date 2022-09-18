reconciliation
deleteChildrenFrom: aNumber in: aParentNode

	aParentNode childrenTreeNodes
		from: aNumber
		to: aParentNode childrenTreeNodes size
		do: [:node | self addUpdate: {#delete. node godotPath}].
	^ super deleteChildrenFrom: aNumber in: aParentNode