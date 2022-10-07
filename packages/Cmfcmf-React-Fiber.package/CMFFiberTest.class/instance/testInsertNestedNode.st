tests - reconciliation
testInsertNestedNode

	| insert references |
	insert := false.
	self openComponentBlock: [{insert ifTrue: [[self bubble: #A] asComponent] ifFalse: [self bubble: #A]. self bubble: #B}].
	references := root children copy.
	self assert: {#A. #B} equals: (root children collect: #tag as: Array).
	
	insert := true.
	react reRenderAll.
	self assert: {#A. #B} equals: (root children collect: #tag as: Array)