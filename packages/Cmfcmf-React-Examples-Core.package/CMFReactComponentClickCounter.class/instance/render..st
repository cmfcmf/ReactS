as yet unclassified
render: props
	
	| clicks |
	clicks := self useState: 0.
	
	^ CMFReactComponentContainer asElementBuilder children: {
		clicks get.
		CMFReactComponentContainer asElementBuilder props: {#direction -> #leftToRight}; children: {
			CMFReactComponentButton asElementBuilder props: {
				#onClick -> [clicks set: [:oldClicks | oldClicks + 1]].
				#label -> 'increment'}; build.
			CMFReactComponentButton asElementBuilder props: {
				#onClick -> [clicks set: 0].
				#label -> 'reset'}; build.
		}; build.
	}; build