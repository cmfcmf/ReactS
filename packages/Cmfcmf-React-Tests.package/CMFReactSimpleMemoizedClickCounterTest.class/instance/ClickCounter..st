running
ClickCounter: props

	<memoize>	
	| clicks |
	clicks := CMFReact useState: 0.

	^ CMFReactComponentWindow asReactNodeBuilder children: {
		CMFReactComponentContainer asReactNodeBuilder children: {
			CMFReactComponentStringWithName asReactNodeBuilder props: {#contents -> clicks get. #name -> 'cnt'}; build.
			CMFReactComponentButton asReactNodeBuilder props: {#name -> 'btn'. #label -> 'increment'. #onClick -> [clicks set: [:old | old + 1]]}; build
		}; build.
	}; build