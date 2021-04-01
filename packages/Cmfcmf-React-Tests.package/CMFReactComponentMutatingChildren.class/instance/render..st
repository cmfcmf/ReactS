as yet unclassified
render: props

	| state |
	state := self useState: 0.
	
	^ CMFReactComponentWindow asElementBuilder children: {
		CMFReactComponentContainer asElementBuilder children: {
			CMFReactComponentButton asElementBuilder props: {#name -> 'next'. #label -> 'next'. #onClick -> [state set: [:old | old + 1]]}; build.
			state get.
			state get caseOf: {
				[0] -> [
					CMFReactComponentButton asElementBuilder props: {#label -> 'some button'. #onClick -> []}; build.
				].
				[1] -> ['some string'].
				[2] -> [{'another string'}].
				[3] -> []}
		}; build.
	}; build