# React/S

WIP: Modern [ReactJS](https://reactjs.org), including React Hooks, implemented in Squeak/Smalltalk.

## Implementation Status


- [x] Node Types
  - [x] String
  - [x] Text
  - [x] nil
  - [x] SequenceableCollection
  - [x] "Function Component"
  - [ ] "Class Component"
  - [x] Morph (via CMFReactNodeMorph)
  - [x] Fragment (via Array)
- [x] [Fragments](https://reactjs.org/docs/fragments.html)
- [ ] [Refs](https://reactjs.org/docs/refs-and-the-dom.html)
- [ ] [Keys](https://reactjs.org/docs/lists-and-keys.html)
- [ ] Hooks
  - [x] [useState](https://reactjs.org/docs/hooks-state.html)
  - [x] [useEffect](https://reactjs.org/docs/hooks-effect.html) (dependency array not yet fully supported)
  - [ ] [useLayoutEffect](https://reactjs.org/docs/hooks-reference.html#uselayouteffect) (not sure if this is even needed)
  - [ ] [useContext](https://reactjs.org/docs/hooks-reference.html#usecontext)
  - [ ] [useReducer](https://reactjs.org/docs/hooks-reference.html#usereducer)
  - [ ] [useCallback](https://reactjs.org/docs/hooks-reference.html#usecallback)
  - [ ] [useMemo](https://reactjs.org/docs/hooks-reference.html#usememo)
  - [ ] [useRef](https://reactjs.org/docs/hooks-reference.html#useref)
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

## Example

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
