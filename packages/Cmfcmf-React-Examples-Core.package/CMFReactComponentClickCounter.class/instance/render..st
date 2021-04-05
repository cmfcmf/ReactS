as yet unclassified
render: props
	
	<memoize>
	
	| clicks |
	clicks := self useState: 0.
	
	^ CMFReactComponentContainer asReactNodeBuilder children: {
		clicks get.
		CMFReactComponentContainer asReactNodeBuilder props: {#direction -> #leftToRight}; children: {
			CMFReactComponentButton asReactNodeBuilder props: {
				#onClick -> [clicks set: [:oldClicks | oldClicks + 1]].
				#label -> 'increment'}; build.
			CMFReactComponentButton asReactNodeBuilder props: {
				#onClick -> [clicks set: 0].
				#label -> 'reset'}; build.
		}; build.
	}; build