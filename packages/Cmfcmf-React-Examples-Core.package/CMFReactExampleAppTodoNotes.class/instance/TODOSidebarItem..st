as yet unclassified
TODOSidebarItem: props

	<memoize>
	
	| todo |
	todo := props at: #todo.

	^ CMFReactComponentContainer asReactNodeBuilder
		children: {
			todo at: #title.
			CMFReactComponentButton asReactNodeBuilder
				props: {#label -> 'select'. #onClick -> [(props at: #setSelectedId) value: (todo at: #id)]};
				build.
			CMFReactComponentButton asReactNodeBuilder
				props: {#label -> 'delete'. #onClick -> [(props at: #dispatch) value: {#delete. todo at: #id}]};
				build};
		build