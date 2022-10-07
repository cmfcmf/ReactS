tests - memoization
testContextInMemoizedComponent

	| visited block |
	visited := 0.
	block := [ | c |
		visited := visited + 1.
		c := CMFReact useContext: CMFReactTestContext.
		(self bubble: #A) props: {#text -> c}].
	self openComponentBlock: [ | count |
		count := CMFReact useState: 1.
		{
			(self bubble: #Click) props: {#click -> [count set: [:c | c + 1]]}.
			CMFReactTestContext
				asProviderNodeWithValue: count get
				children: {block asComponent memoize: true}}].
	self assert: 1 equals: visited.
	react reRenderAll.
	self assert: 1 equals: visited.
	self assert: 1 equals: ((root findTag: #A) props at: #text).
	
	((root findTag: #Click) props at: #click) value.
	self assert: 2 equals: ((root findTag: #A) props at: #text).
	self assert: 2 equals: visited.
	
	react reRenderAll.
	self assert: 2 equals: visited