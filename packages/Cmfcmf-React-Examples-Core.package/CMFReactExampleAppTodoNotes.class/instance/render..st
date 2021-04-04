as yet unclassified
render: props

	| todos nextId selectedId selectedTodo |
	nextId := self useRef: 1.
	todos := self
		useReducer: [:state :action |
			action first caseOf: {
				[#add] -> [ | id title |
					title := (UIManager default request: 'Title') ifNil: [''].
					title 
						ifEmpty: [state] 
						ifNotEmpty: [| content |
							content := (UIManager default request: 'Content') ifNil: [''].
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
		props: {#label -> 'TODO Notes'. #defaultExtent -> (600 @ 300)};
		children: {
			(#Sidebar asElementBuilder: self)
				props: {#todos -> todos get. #todosDispatch -> todos dispatch. #setSelectedId -> selectedId setter};
				build.
			CMFReactComponentContainer asElementBuilder
				props: {#scrollable -> true. #layoutFrame -> (LayoutFrame fractions: (0.3 @ 0 corner: 1 @ 1))};
				children: {
					selectedTodo
						ifNil: ['-- nothing selected --']
						ifNotNil: [{selectedTodo at: #title. selectedTodo at: #content}]};
				build};
		build