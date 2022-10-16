tests - hooks
testDynamicListWithHooksAfter

	self openComponentBlock: [ | count |
		count := CMFReact useState: 1.
		((Array new: count get) collectWithIndex: [:x :i | (self bubble: #A) key: i]), {
			(self bubble: #Button) props: {#pressed -> [count set: [:x | x + 1]]}.
			[
				CMFReact useState: 0.
				nil] asComponent.
			[
				CMFReact useContext: CMFReactTestContext.
				nil] asComponent}].
	((root findTag: #Button) props at: #pressed) value.
	((root findTag: #Button) props at: #pressed) value