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
- [ ] [Keys](https://reactjs.org/docs/lists-and-keys.html)
- [ ] Hooks
  - [x] [useState](https://reactjs.org/docs/hooks-state.html)
  - [x] [useEffect](https://reactjs.org/docs/hooks-effect.html)
  - [ ] [useLayoutEffect](https://reactjs.org/docs/hooks-reference.html#uselayouteffect) (not sure if this is even needed)
  - [ ] [useContext](https://reactjs.org/docs/hooks-reference.html#usecontext) (missing support for memo)
  - [x] [useReducer](https://reactjs.org/docs/hooks-reference.html#usereducer)
  - [x] [useCallback](https://reactjs.org/docs/hooks-reference.html#usecallback)
  - [x] [useMemo](https://reactjs.org/docs/hooks-reference.html#usememo)
  - [x] [useRef](https://reactjs.org/docs/hooks-reference.html#useref)
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
	
	^ CMFReactComponentWindow asElementBuilder
		props: {#label -> 'My Window'. #defaultExtent -> (400 @ 225)};
		children: {
			CMFReactComponentContainer asElementBuilder
				children: {
					clicks get.
					CMFReactComponentButton asElementBuilder
						props: {#label -> 'increment'. #onClick -> [clicks set: [:old | old + 1]]};
						build};
				build};
		build
```

`MyExampleComponent` must inherit from `CMFReactComponent`. To render and open it, execute `CMFReactComponent openInHand`

### TODO Notes App

A window that manages a list of TODO items.

```smalltalk
CMFReactExampleAppTodoNotes >> render: props

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
```
