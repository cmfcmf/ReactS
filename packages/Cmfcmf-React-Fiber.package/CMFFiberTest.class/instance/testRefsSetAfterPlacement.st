tests - useRef
testRefsSetAfterPlacement

	| change currentRef |
	change := false.
	currentRef := nil.
	self openComponentBlock: [ | ref bubble |
		ref := CMFReact useRef: nil.
		CMFReact useEffect: [currentRef := ref get].
		bubble := self bubble: #A.
		change ifTrue: [bubble ref: ref].
		bubble].
	change := true.
	react reRenderAll.
	self assert: currentRef notNil