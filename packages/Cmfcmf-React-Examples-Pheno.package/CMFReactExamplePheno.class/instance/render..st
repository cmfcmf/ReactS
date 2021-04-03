as yet unclassified
render: props

	^  CMFReactComponentWindow asElementBuilder props: {#label -> 'Demo Window'. #defaultExtent -> (225@400)}; children: {
		PHWidget asReactNodeBuilder create: [:c | c new withLayout; vertical: true; yourself]; children: {
			PHLabel asReactNodeBuilder create: [:c | c pageHeader: 'Example']; build.
			PHAlert asReactNodeBuilder create: [:c | c text: 'Info! :|' type: #info]; build.
			PHTextArea asReactNodeBuilder create: [:c | c placeholder: 'foo']; build.
		}; build.
	}; build