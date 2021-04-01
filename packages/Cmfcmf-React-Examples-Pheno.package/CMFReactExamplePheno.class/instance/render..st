as yet unclassified
render: props

	^  CMFReactComponentWindow asElementBuilder props: {#label -> 'Demo Window'. #defaultExtent -> (225@400)}; children: {
		[PHWidget new withLayout; vertical: true; yourself] asCMFReactNodeMorphBuilder children: {
			[PHLabel pageHeader: 'Example'] asCMFReactNodeMorphBuilder build.
			[PHAlert text: 'Info! :|' type: #info] asCMFReactNodeMorphBuilder build.
			[PHTextArea placeholder: 'foo'] asCMFReactNodeMorphBuilder build.
		}; build.
	}; build