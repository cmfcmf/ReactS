as yet unclassified
component

	| reducer |
	reducer := [:state :action |
		action caseOf: {
			[#increment] -> [state + 1].
			[#decrement] -> [state - 1].
			[#reset] -> [0]}].
	
	^ [ | count |	
		count := CMFReact useReducer: reducer initialState: 0.

		CMFReactComponentWindow asElementBuilder
			children: {
				CMFReactComponentContainer asElementBuilder
					children: {
						CMFReactComponentString asElementBuilder
							props: {#name -> 'count'. #contents -> count get};
							build.
						CMFReactComponentButton asElementBuilder
							props: {#name -> 'inc'. #label -> 'increment'. #onClick -> [count dispatch: #increment]};
							build.
						CMFReactComponentButton asElementBuilder
							props: {#name -> 'dec'. #label -> 'decrement'. #onClick -> [count dispatch: #decrement]};
							build.
						CMFReactComponentButton asElementBuilder
							props: {#name -> 'reset'. #label -> 'reset'. #onClick ->[count dispatch value: #reset]};
							build.
					};
					build.
			};
			build]