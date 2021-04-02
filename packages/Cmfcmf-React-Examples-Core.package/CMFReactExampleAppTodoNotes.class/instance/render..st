as yet unclassified
render: props

	| todos nextId |
	nextId := self useRef: 1.
	todos := self useReducer: [:state :action | action first caseOf: {
		[#add] -> [| id content |
			content := UIManager default request: 'Content'.
			content 
				ifEmpty: [state] 
				ifNotEmpty: [
					id := nextId get.
					nextId set: id + 1.
					state copyWith: (Dictionary newFrom: {#id -> id. #content -> content})]].
		[#delete] -> [| id |
			id := action second.
			state copyWithout: (state detect: [:oldTodo | (oldTodo at: #id) == id])]}] initialState: {}.
	
	^ CMFReactComponentWindow asElementBuilder
		props: {#label -> 'TODO Notes'. #defaultExtent -> (400 @ 225)};
		children: {
			CMFReactComponentContainer asElementBuilder
				props: {#scrollable -> true};
				children: {
					CMFReactComponentButton asElementBuilder
						props: {#label -> 'Add TODO Note'. #onClick -> [todos dispatch: {#add}]};
						build.
					todos get collect: [:each |
						CMFReactComponentContainer asElementBuilder
							children: {
								each at: #content.
								CMFReactComponentButton asElementBuilder
									props: {#label -> 'delete'. #onClick -> [todos dispatch: {#delete. each at: #id}]};
									build};
							build]};
				build};
		build