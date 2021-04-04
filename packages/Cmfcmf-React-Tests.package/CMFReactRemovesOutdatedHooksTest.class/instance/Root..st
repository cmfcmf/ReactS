as yet unclassified
Root: props
	
	| clicks |
	clicks := CMFReact useState: 0.

	^ CMFReactComponentContainer asElementBuilder children: {
		CMFReactComponentString asElementBuilder props: {#contents -> clicks get. #name -> 'cnt'}; build.
		clicks get == 0 ifTrue: [(#ConditionalChild asElementBuilder: self) build] ifFalse: [nil].
		CMFReactComponentButton asElementBuilder props: {#name -> 'btn'. #label -> 'increment'. #onClick -> [clicks set: [:old | old + 1]]}; build
	}; build