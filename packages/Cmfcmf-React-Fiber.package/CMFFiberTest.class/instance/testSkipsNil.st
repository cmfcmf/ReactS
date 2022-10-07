tests - reconciliation
testSkipsNil

	self openComponentBlock: [{nil. self bubble: #Hello. nil}].
	
	self assert: {#Hello} equals: (root children collect: #tag as: Array)