tests - useContext
testUseContextProvided

	self openComponentBlock: [
		CMFReactTestContext asProviderNodeWithValue: 'changed' children: {
			[ | value |
				value := CMFReact useContext: CMFReactTestContext.
				(self bubble: #A) props: {#a -> value}] asComponent}].
	self assert: 'changed' equals: ((root findTag: #A) props at: #a)