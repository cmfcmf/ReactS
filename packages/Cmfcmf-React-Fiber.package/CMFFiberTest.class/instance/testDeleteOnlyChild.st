tests - reconciliation
testDeleteOnlyChild

	| delete |
	delete := false.
	self openComponentBlock: [{delete ifTrue: [nil] ifFalse: [self bubble: #World]}].
	
	self assert: {#World} equals: (root children collect: #tag as: Array).
	
	delete := true.
	react reRenderAll.
	self assert: {} equals: (root children collect: #tag as: Array)