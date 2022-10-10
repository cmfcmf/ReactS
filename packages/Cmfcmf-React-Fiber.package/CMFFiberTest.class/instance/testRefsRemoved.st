tests - useRef
testRefsRemoved

	| change currentRef |
	change := false.
	currentRef := nil.
	self openComponentBlock: [ | ref bubble |
		ref := CMFReact useRef: nil.
		CMFReact useEffect: [currentRef := ref get].
		bubble := self bubble: #A.
		change ifFalse: [bubble ref: ref].
		{bubble}].
	self assert: #A equals: currentRef tag.
	change := true.
	react reRenderAll.
	self assert: currentRef isNil