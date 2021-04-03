as yet unclassified
render: props

	| todos nextId selectedId selectedTodo |
	nextId := self useRef: 1.
	todos := self
		useReducer: [:state :action |
			action first caseOf: {
				[#add] -> [ | id title content |
					title := UIManager default request: 'Title'.
					content := UIManager default request: 'Content'.
					title ifEmpty: [state] ifNotEmpty: [
						id := nextId get.
						nextId set: id + 1.
						state copyWith: (Dictionary newFrom: {#id -> id. #title -> title. #content -> content})]].
				[#delete] -> [ | id |
					id := action second.
					state copyWithout: (state detect: [:oldTodo | (oldTodo at: #id) == id])]}]
		initialState: {}.
	
	selectedId := self useState: 0.
	selectedTodo := todos get detect: [:each | (each at: #id) == selectedId get] ifNone: [nil].
	
	^ CMFReactComponentWindow asElementBuilder
		props: {#label -> 'TODO Notes'. #defaultExtent -> (400 @ 225)};
		children: {
			CMFReactComponentContainer asElementBuilder
				props: {#layoutFrame -> (LayoutFrame fractions: (0 @ 0 extent: 0.3 @ 0) offsets: (0 @ 0 extent: 0 @ 20))};
				children: {
					CMFReactComponentButton asElementBuilder
						props: {#label -> 'Add TODO Note'. #onClick -> [todos dispatch: {#add}]};
						build};
				build.
			CMFReactComponentContainer asElementBuilder
				props: {
					#scrollable -> true.
					#layoutFrame -> (LayoutFrame fractions: (0 @ 0 extent: 0.3 @ 1) offsets: (0 @ 20 extent: 0 @ -20))};
				children: {
					todos get collect: [:each |
						(#TODOItem asElementBuilder: self)
							props: {#todo -> each. #dispatch -> todos dispatch. #setSelectedId -> selectedId setter};
							build]};
				build.
			CMFReactComponentContainer asElementBuilder
				props: {#scrollable -> true. #layoutFrame -> (LayoutFrame fractions: (0.3 @ 0 corner: 1 @ 1))};
				children: {
					selectedTodo
						ifNil: ['-- nothing selected --']
						ifNotNil: [{selectedTodo at: #title. selectedTodo at: #content}]};
				build};
		build