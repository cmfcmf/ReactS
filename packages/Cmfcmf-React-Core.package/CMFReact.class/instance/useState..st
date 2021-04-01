hooks
useState: default

	| hook id |
	id := elementTree currentId.
	Transcript showln: 'useState ', id, ' ', elementTree currentName.
	hook := (stateHooks at: id ifAbsentPut: [OrderedCollection new]) 
			at: useStateHookIndex 
			ifAbsentPut: [
				CMFReactHookUseState new
					initState: default onChange: [self reRenderNodeWithId: id];
					yourself].
	useStateHookIndex := useStateHookIndex + 1.
	^ hook