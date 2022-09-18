reconciliation
deleteChildrenFrom: aNumber in: aParentNode

	aNumber
		to: aParentNode childrenTreeNodes size
		do: [:index | self addUpdate: {#delete. aParentNode godotPath. index}].
	^ super deleteChildrenFrom: aNumber in: aParentNode