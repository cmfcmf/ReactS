as yet unclassified
render: props

	| clicks |
	clicks := self useState: 0.
	
	^ CMFReactComponentWindow asElementBuilder
		props: {#label -> 'My Window'. #defaultExtent -> (400@225)};
		children: {
			clicks get.
			CMFReactComponentButton asElementBuilder
				props: {#label -> 'increment'. #onClick -> [clicks set: [:old | old + 1]]};
				build};
		build
		