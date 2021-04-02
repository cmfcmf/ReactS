running
component 

	^ [
		| clicks |
		clicks := CMFReact useState: 0.
	
		CMFReactComponentWindow asElementBuilder children: {
			CMFReactComponentContainer asElementBuilder children: {
				CMFReactComponentString asElementBuilder props: {#contents -> clicks get. #name -> 'cnt'}; build.
				CMFReactComponentButton asElementBuilder props: {#name -> 'btn'. #label -> 'increment'. #onClick -> [clicks set: [:old | old + 1]]}; build
			}; build.
		}; build	
	] 