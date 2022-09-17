reconciliation
addChild: aNode in: aParentNode

	self addUpdate: {#add. aNode}.
	^ super addChild: aNode in: aParentNode