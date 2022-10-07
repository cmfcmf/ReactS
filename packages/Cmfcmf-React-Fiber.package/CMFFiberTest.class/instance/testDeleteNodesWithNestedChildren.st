tests - reconciliation
testDeleteNodesWithNestedChildren

	| delete |
	delete := false.
	self openComponentBlock: [
		{
			self bubble: #Hello.
			delete ifTrue: [nil] ifFalse: [[{self bubble: #Child1. self bubble: #Child2}] asComponent]}].
	
	self assert: {#Hello. #Child1. #Child2} equals: (root children collect: #tag as: Array).
	
	delete := true.
	react reRenderAll.
	self assert: {#Hello} equals: (root children collect: #tag as: Array)