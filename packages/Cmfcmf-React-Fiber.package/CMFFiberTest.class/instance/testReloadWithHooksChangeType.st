tests - hooks
testReloadWithHooksChangeType

	| change |
	change := false.
	self openComponentBlock: [ | label |
		label := change ifTrue: [CMFReact useRef: 'ref'] ifFalse: [CMFReact useState: 'initial'].
		(self bubble: #Label) props: {#text -> label get. #click -> [label set: 'changed']}].
	((root findTag: #Label) props at: #click) value.
	self assert: 'changed' equals: ((root findTag: #Label) props at: #text).
	change := true.
	react onCodeChanged.
	react reRenderAll.
	self assert: 'ref' equals: ((root findTag: #Label) props at: #text)