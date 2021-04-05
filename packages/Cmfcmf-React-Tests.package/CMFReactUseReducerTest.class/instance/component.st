running
component

	| reducer |
	reducer := [:state :action |
		action caseOf: {
			[#increment] -> [state + 1].
			[#decrement] -> [state - 1].
			[#reset] -> [0]}].
	
	^ [ | count |	
		count := CMFReact useReducer: reducer initialState: 0.

		CMFReactComponentWindow asReactNodeBuilder
			children: {
				CMFReactComponentContainer asReactNodeBuilder
					children: {
						CMFReactComponentString asReactNodeBuilder
							props: {#name -> 'count'. #contents -> count get};
							build.
						CMFReactComponentButton asReactNodeBuilder
							props: {#name -> 'inc'. #label -> 'increment'. #onClick -> [count dispatch: #increment]};
							build.
						CMFReactComponentButton asReactNodeBuilder
							props: {#name -> 'dec'. #label -> 'decrement'. #onClick -> [count dispatch: #decrement]};
							build.
						CMFReactComponentButton asReactNodeBuilder
							props: {#name -> 'reset'. #label -> 'reset'. #onClick ->[count dispatch value: #reset]};
							build.
					};
					build.
			};
			build]