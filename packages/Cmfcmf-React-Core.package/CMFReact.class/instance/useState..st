hooks
useState: default

	| hook id |
	id := elementTree currentId.
	Transcript showln: 'useState ', id, ' ', elementTree currentName.
	hook := (stateHooks at: id ifAbsentPut: [OrderedCollection new]) 
			at: useStateHookIndex 
			ifAbsentPut: [
				CMFReactHookUseState new
					initState: default;
					when: #stateChanged send: #reRenderNodeWithId: to: self with: id;
					yourself].
	useStateHookIndex := useStateHookIndex + 1.
	^ hook