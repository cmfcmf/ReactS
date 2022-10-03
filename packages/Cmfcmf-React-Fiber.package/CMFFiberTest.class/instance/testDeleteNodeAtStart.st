tests - reconciliation
testDeleteNodeAtStart

	| delete second |
	delete := false.
	self openComponentBlock: [{delete ifTrue: [nil] ifFalse: [self bubble: #World]. self bubble: #Hello}].
	second := root children second.
	self assert: {#World. #Hello} equals: (root children collect: #tag as: Array).
	
	delete := true.
	react reRenderAll.
	self assert: {#Hello} equals: (root children collect: #tag as: Array).
	self deny: second identical: root children first