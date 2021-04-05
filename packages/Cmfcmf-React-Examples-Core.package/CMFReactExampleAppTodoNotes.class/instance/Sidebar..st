as yet unclassified
Sidebar: props
	
	<memoize>
	
	| todos todosDispatch setSelectedId |
	todos := props at: #todos.
	todosDispatch := props at: #todosDispatch.
	setSelectedId := props at: #setSelectedId.
	
	^ CMFReactComponentContainer asReactNodeBuilder
		props: {
			#layoutFrame -> (LayoutFrame fractions: (0@0 extent: 0.3@1))};
		children: {
			CMFReactComponentContainer asReactNodeBuilder
				props: {#layoutFrame -> (LayoutFrame fractions: (0@0 extent: 1@0) offsets: (0@0 extent: 0@20))};
				children: {
					CMFReactComponentButton asReactNodeBuilder
						props: {#label -> 'Add TODO Note'. #onClick -> [todosDispatch value: {#add}]};
						build};
				build.
			CMFReactComponentContainer asReactNodeBuilder
				props: {
					#scrollable -> true.
					#layoutFrame -> (LayoutFrame fractions: (0@0 extent: 1@1) offsets: (0@20 extent: 0@ -20))};
				children: {
					todos collect: [:each |
						(#TODOSidebarItem asReactNodeBuilder: self)
							props: {#key -> (each at: #id). #todo -> each. #dispatch -> todosDispatch. #setSelectedId -> setSelectedId};
							build]};
				build};
		build.