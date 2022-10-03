tests - reconciliation
testCreateHostNodeNoArray

	self openComponentBlock: [self bubble: #Hello].
	
	self assert: #Hello equals: root children first tag