as yet unclassified
render: props
	
	| clicks |
	clicks := self useState: 0.
	
	^ {
		CMFReactComponentWindow asReactNodeBuilder props: {#label -> 'First Window'}; children: {	
			CMFReactComponentContainer asReactNodeBuilder children: {
				clicks get.
				CMFReactComponentButton asReactNodeBuilder props: {#label -> 'increment'. #onClick -> [clicks set: [:old | old + 1]]}; build.
			}; build
		}; build.
		CMFReactComponentWindow asReactNodeBuilder props: {#label -> 'Second Window'}; children: {
			'Second Window'.
		}; build.
	}