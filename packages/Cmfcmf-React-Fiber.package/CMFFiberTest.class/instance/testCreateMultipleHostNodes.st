tests - reconciliation
testCreateMultipleHostNodes

	self openComponentBlock: [{self bubble: #Hello. self bubble: #World}].
	
	self assert: {#Hello. #World} equals: (root children collect: #tag as: Array)