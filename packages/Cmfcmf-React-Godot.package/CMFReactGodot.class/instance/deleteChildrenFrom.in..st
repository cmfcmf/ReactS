reconciliation
deleteChildrenFrom: aNumber in: aParentNode

	aNumber
		to: aParentNode childrenTreeNodes size
		do: [:index | self addUpdate: {#delete. aParentNode childrenTreeNodes at: index}].
	^ super deleteChildrenFrom: aNumber in: aParentNode