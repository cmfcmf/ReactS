as yet unclassified
Root: props
	
	| clicks |
	clicks := CMFReact useState: 0.

	^ CMFReactComponentContainer asReactNodeBuilder children: {
		CMFReactComponentStringWithName asReactNodeBuilder props: {#contents -> clicks get. #name -> 'cnt'}; build.
		clicks get == 0 ifTrue: [(#ConditionalChild asReactNodeBuilder: self) build] ifFalse: [nil].
		CMFReactComponentButton asReactNodeBuilder props: {#name -> 'btn'. #label -> 'increment'. #onClick -> [clicks set: [:old | old + 1]]}; build
	}; build