tests - reconciliation
testRootComponentStaysTheSame

	| first |
	self openComponentBlock: [nil].
	first := react currentRoot.
	react reRenderAll.
	self assert: first identical: react currentRoot alternate.
	react reRenderAll.
	self assert: first identical: react currentRoot.
	react reRenderAll.
	self assert: first identical: react currentRoot alternate