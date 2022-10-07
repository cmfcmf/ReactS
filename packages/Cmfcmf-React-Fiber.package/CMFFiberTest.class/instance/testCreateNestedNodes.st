tests - reconciliation
testCreateNestedNodes

	self openComponentBlock: [{[self bubble: #Hello] asComponent. self bubble: #World}].
	
	self assert: {#Hello. #World} equals: (root children collect: #tag as: Array)