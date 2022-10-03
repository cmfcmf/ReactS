tests - useState
testUseStateSet

	self openComponentBlock: [ | count |
		count := CMFReact useState: 0.
		(self bubble: #A) props: {#click -> [count set: 1]. #label -> count get}].
	self assert: 0 equals: ((root findTag: #A) props at: #label).
	
	react reRenderAll.
	self assert: 0 equals: ((root findTag: #A) props at: #label).
	
	((root findTag: #A) props at: #click) value.
	self assert: 1 equals: ((root findTag: #A) props at: #label)