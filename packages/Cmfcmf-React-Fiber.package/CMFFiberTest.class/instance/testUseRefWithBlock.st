tests - useRef
testUseRefWithBlock

	| found |
	found := nil.
	self openComponentBlock: [(self bubble: #A) ref: [:bubble | found := bubble]].
	self assert: (root findTag: #A) equals: found