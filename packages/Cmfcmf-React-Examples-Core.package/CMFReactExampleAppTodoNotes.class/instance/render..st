as yet unclassified
render: props

	| todos nextId addTodo deleteTodo |
	nextId := self useRef: 1.
	todos := self useState: {}.
	
	addTodo := [
		todos set: [:old | | id |
			id := nextId get.
			nextId set: id + 1.
			old copyWith: (Dictionary newFrom: {#id -> id. #content -> (UIManager default request: 'Note content?')})]].
	
	deleteTodo := [:id | todos set: [:old | old copyWithout: (old detect: [:oldEach | (oldEach at: #id) == id])]].
	
	^ CMFReactComponentWindow asElementBuilder
		props: {#label -> 'TODO Notes'. #defaultExtent -> (400 @ 225)};
		children: {
			CMFReactComponentContainer asElementBuilder
				props: {#scrollable -> true};
				children: {
					CMFReactComponentButton asElementBuilder
						props: {#label -> 'Add TODO Note'. #onClick -> addTodo};
						build.
					todos get collect: [:each |
						CMFReactComponentContainer asElementBuilder
							children: {
								each at: #content.
								CMFReactComponentButton asElementBuilder
									props: {#label -> 'delete'. #onClick -> [deleteTodo value: (each at: #id)]};
									build};
							build]};
				build};
		build