tests - useRef
testUseRefForHostComponent

	self openComponentBlock: [ | ref |
		ref := CMFReact useRef: nil.
		(self bubble: #A) ref: ref].
	self assert: (root findTag: #A) equals: react currentRoot child hooks first get