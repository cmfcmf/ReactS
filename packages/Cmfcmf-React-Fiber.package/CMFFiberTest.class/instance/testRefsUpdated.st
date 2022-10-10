tests - useRef
testRefsUpdated

	| change currentRef |
	change := false.
	currentRef := nil.
	self openComponentBlock: [ | ref bubbleA bubbleB |
		ref := CMFReact useRef: nil.
		CMFReact useEffect: [currentRef := ref get].
		bubbleA := self bubble: #A.
		bubbleB := self bubble: #B.
		change ifTrue: [bubbleA ref: ref] ifFalse: [bubbleB ref: ref].
		{bubbleA. bubbleB}].
	self assert: #B equals: currentRef tag.
	change := true.
	react reRenderAll.
	self assert: #A equals: currentRef tag