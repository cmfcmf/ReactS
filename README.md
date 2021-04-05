# React/S

WIP: Modern [ReactJS](https://reactjs.org), including React Hooks, implemented in Squeak/Smalltalk.

## Implementation Status


- [x] Node Types
  - [x] String
  - [x] Text
  - [x] nil
  - [x] SequenceableCollection
  - [x] Components
  - [x] Morph (via CMFReactNodeMorph)
  - [x] Fragment (via Array)
- [x] [Fragments](https://reactjs.org/docs/fragments.html)
- [x] [memo](https://reactjs.org/docs/react-api.html#reactmemo)
- [ ] [Refs](https://reactjs.org/docs/refs-and-the-dom.html)
- [x] [Keys](https://reactjs.org/docs/lists-and-keys.html)
- [ ] Hooks
  - [x] [useState](https://reactjs.org/docs/hooks-state.html)
  - [x] [useEffect](https://reactjs.org/docs/hooks-effect.html)
  - [x] [useContext](https://reactjs.org/docs/hooks-reference.html#usecontext)
  - [x] [useReducer](https://reactjs.org/docs/hooks-reference.html#usereducer)
  - [x] [useCallback](https://reactjs.org/docs/hooks-reference.html#usecallback)
  - [x] [useMemo](https://reactjs.org/docs/hooks-reference.html#usememo)
  - [x] [useRef](https://reactjs.org/docs/hooks-reference.html#useref)
  - [ ] [useLayoutEffect](https://reactjs.org/docs/hooks-reference.html#uselayouteffect) (not sure if this is even needed)
  - [ ] [useImperativeHandle](https://reactjs.org/docs/hooks-reference.html#useimperativehandle)
  - [ ] [useDebugValue](https://reactjs.org/docs/hooks-reference.html#usedebugvalue)
- [x] Fast Refresh (refresh UI on source code changes without losing its state)

## Installation

```smalltalk
Metacello new
  baseline: 'CmfcmfReact';
  repository: 'github://cmfcmf/ReactS:main/packages';
  load: #default.
```

## Demo

```smalltalk
CMFReactComponentDemo openInHand
```

## Examples

### Simple Click Counter

A simple example component that provides a button to increment a number is shown below:

```smalltalk
MyExampleComponent >> render: props

	| clicks |
	clicks := self useState: 0.
	
	^ CMFReactComponentContainer asReactNodeBuilder children: {
		clicks get.
		CMFReactComponentContainer asReactNodeBuilder props: {#direction -> #leftToRight}; children: {
			CMFReactComponentButton asReactNodeBuilder props: {
				#onClick -> [clicks set: [:oldClicks | oldClicks + 1]].
				#label -> 'increment'}; build.
			CMFReactComponentButton asReactNodeBuilder props: {
				#onClick -> [clicks set: 0].
				#label -> 'reset'}; build.
		}; build.
	}; build
```

`MyExampleComponent` must inherit from `CMFReactComponent`. To render and open it, execute `MyExampleComponent openInHand`

### TODO Notes App

A window that manages a list of TODO items (`CMFReactExampleAppTodoNotes`).

```smalltalk
CMFReactExampleAppTodoNotes >> render: props

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
	
	^ CMFReactComponentWindow asReactNodeBuilder
		props: {#label -> 'TODO Notes'. #defaultExtent -> (600 @ 300)};
		children: {
			(#Sidebar asReactNodeBuilder: self)
				props: {#todos -> todos get. #todosDispatch -> todos dispatch. #setSelectedId -> selectedId setter};
				build.
			CMFReactComponentContainer asReactNodeBuilder
				props: {#scrollable -> true. #layoutFrame -> (LayoutFrame fractions: (0.3 @ 0 corner: 1 @ 1))};
				children: {
					selectedTodo
						ifNil: ['-- nothing selected --']
						ifNotNil: [{selectedTodo at: #title. selectedTodo at: #content}]};
				build};
		build


CMFReactExampleAppTodoNotes >> Sidebar: props
	
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


CMFReactExampleAppTodoNotes >> TODOSidebarItem: props

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
```
