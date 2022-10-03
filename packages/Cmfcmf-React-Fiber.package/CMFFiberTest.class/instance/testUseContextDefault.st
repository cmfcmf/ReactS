tests - useContext
testUseContextDefault

	self openComponentBlock: [ | value |
		value := CMFReact useContext: CMFReactTestContext.
		(self bubble: #A) props: {#a -> value}].
	self assert: 'initial' equals: ((root findTag: #A) props at: #a)