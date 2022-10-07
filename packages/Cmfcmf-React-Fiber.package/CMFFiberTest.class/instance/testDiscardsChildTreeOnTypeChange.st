tests - reconciliation
testDiscardsChildTreeOnTypeChange

	| change original new |
	change := false.
	self openComponentBlock: [(self bubble: (change ifTrue: [#B] ifFalse: [#A])) children: {self bubble: #Child}].
	original := (root findTag: #A) findTag: #Child.
	
	change := true.
	react reRenderAll.
	new := (root findTag: #B) findTag: #Child.
	self deny: original == new