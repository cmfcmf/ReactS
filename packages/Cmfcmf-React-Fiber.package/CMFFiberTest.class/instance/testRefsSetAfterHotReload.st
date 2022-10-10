tests - useRef
testRefsSetAfterHotReload

	| change error currentRef |
	change := false.
	error := false.
	currentRef := nil.
	self openComponentBlock: [ | ref bubble |
		ref := CMFReact useRef: nil.
		CMFReact useEffect: [currentRef := ref get].
		bubble := self bubble: #A.
		error ifTrue: [self error].
		change ifTrue: [bubble ref: ref].
		bubble].
	error := true.
	self should: [react reRenderAll] raise: Error.
	change := true.
	error := false.
	react reRenderAll.
	self assert: currentRef notNil