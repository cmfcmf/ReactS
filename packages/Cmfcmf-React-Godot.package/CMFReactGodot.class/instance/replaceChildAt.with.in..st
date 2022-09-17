reconciliation
replaceChildAt: aNumber with: aNode in: aParentNode

	self addUpdate: {#replace. aParentNode childrenTreeNodes at: aNumber. aNode}.
	super replaceChildAt: aNumber with: aNode in: aParentNode