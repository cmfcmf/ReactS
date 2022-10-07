tests - reconciliation
testToggleVisibleViaSetState

	| runs |
	runs := OrderedCollection new.
	self openComponentBlock: [ | state visible |
		visible := CMFReact useState: false.
		state := CMFReact useState: nil.
		{
			[visible get ifTrue: [self bubble: #A]] asComponent.
			(self bubble: #Button) props: {#pressed -> [visible set: [:v | v not]]}}].
	
	((root findTag: #Button) props at: #pressed) value.
	root findTag: #A.
	((root findTag: #Button) props at: #pressed) value.
	self should: [root findTag: #A] raise: Error.
	
	((root findTag: #Button) props at: #pressed) value.
	root findTag: #A.
	((root findTag: #Button) props at: #pressed) value.
	self should: [root findTag: #A] raise: Error