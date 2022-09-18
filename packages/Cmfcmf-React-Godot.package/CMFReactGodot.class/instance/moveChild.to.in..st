reconciliation
moveChild: aNode to: anotherNumber in: aParentNode

	self addUpdate: {#move. aNode godotId}.
	super moveChild: aNode to: anotherNumber in: aParentNode