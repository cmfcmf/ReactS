tests - reconciliation
testConditionalReplace

	self openComponentBlock: [:props | | active |
		active := CMFReact useState: false.
		{
			(self bubble: #Button) props: {#pressed -> [active set: [:b | b not]]}.
			active get
				ifTrue: [(self bubble: #Label) children: {self bubble: #Child}]
				ifFalse: [self bubble: #Spatial]}].
	root findTag: #Spatial.
	((root findTag: #Button) props at: #pressed) value.
	root findTag: #Label.
	self should: [root findTag: #Spatial] raise: Error