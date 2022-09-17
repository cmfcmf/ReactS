reconciliation
moveChild: aNode to: anotherNumber in: aParentNode

	self addUpdate: {#move. aNode}.
	super moveChild: aNode to: anotherNumber in: aParentNode