reconciliation
addChild: aNode in: aParentNode

	aNode isGodotNode ifTrue: [self addUpdate: {#add. aParentNode godotPath. aNode isResource. aNode godotId. aNode godotClass. aNode}].
	^ super addChild: aNode in: aParentNode