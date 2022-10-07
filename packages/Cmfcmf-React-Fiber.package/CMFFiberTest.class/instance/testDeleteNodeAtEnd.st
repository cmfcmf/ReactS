tests - reconciliation
testDeleteNodeAtEnd

	| delete |
	delete := false.
	self openComponentBlock: [{self bubble: #Hello. delete ifTrue: [nil] ifFalse: [self bubble: #World]}].
	
	self assert: {#Hello. #World} equals: (root children collect: #tag as: Array).
	
	delete := true.
	react reRenderAll.
	self assert: {#Hello} equals: (root children collect: #tag as: Array)