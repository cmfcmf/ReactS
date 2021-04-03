as yet unclassified
TODOItem: props

	| todo |
	todo := props at: #todo.
	
	^ CMFReactComponentContainer asElementBuilder
		children: {
			todo at: #title.
			CMFReactComponentButton asElementBuilder
				props: {#label -> 'select'. #onClick -> [(props at: #setSelectedId) value: (todo at: #id)]};
				build.
			CMFReactComponentButton asElementBuilder
				props: {#label -> 'delete'. #onClick -> [(props at: #dispatch) value: {#delete. todo at: #id}]};
				build};
		build