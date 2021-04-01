as yet unclassified
render: props
	
	| clicks |
	clicks := self useState: 0.
	
	^ {
		CMFReactComponentWindow asElementBuilder props: {#label -> 'First Window'}; children: {	
			CMFReactComponentContainer asElementBuilder children: {
				clicks get.
				CMFReactComponentButton asElementBuilder props: {#label -> 'increment'. #onClick -> [clicks set: [:old | old + 1]]}; build.
			}; build
		}; build.
		CMFReactComponentWindow asElementBuilder props: {#label -> 'Second Window'}; children: {
			'Second Window'.
		}; build.
	}