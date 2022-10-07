tests - reconciliation
testComponentStaysTheSame

	| first |
	self openComponentBlock: [nil].
	first := react currentRoot child.
	react reRenderAll.
	self assert: first identical: react currentRoot child alternate.
	react reRenderAll.
	self assert: first identical: react currentRoot child.
	react reRenderAll.
	self assert: first identical: react currentRoot child alternate