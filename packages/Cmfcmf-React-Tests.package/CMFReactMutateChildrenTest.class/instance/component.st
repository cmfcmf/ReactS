running
component

	^ [| state |
		state := CMFReact useState: 0.
	
		CMFReactComponentWindow asReactNodeBuilder children: {
			CMFReactComponentContainer asReactNodeBuilder children: {
				CMFReactComponentButton asReactNodeBuilder props: {#name -> 'next'. #label -> 'next'. #onClick -> [state set: [:old | old + 1]]}; build.
				state get.
				state get caseOf: {
					[0] -> [
						CMFReactComponentButton asReactNodeBuilder props: {#label -> 'some button'. #onClick -> []}; build.
					].
					[1] -> ['some string'].
					[2] -> [{'another string'}].
					[3] -> []}
			}; build.
		}; build	
	]