hooks
useState: default

	| hook id |
	id := elementTree currentId.
	hook := (stateHooks at: id ifAbsentPut: [OrderedCollection new]) 
			at: useStateHookIndex 
			ifAbsentPut: [
				CMFReactHookUseState new
					initState: default onUpdate: [
						elementTree resetToNodeWithId: id during: [:treeNode | | oldRenderResult owner newRenderResult |
							oldRenderResult := treeNode renderResult asOrderedCollection.
							self assert: (oldRenderResult allSatisfy: [:each | each world notNil]).
							owner := oldRenderResult first owner.
							newRenderResult := (self renderNode: treeNode node) asOrderedCollection.
							oldRenderResult with: newRenderResult do: [:oldMorph :newMorph | owner replaceSubmorph: oldMorph by: newMorph]]];
					yourself].
	useStateHookIndex := useStateHookIndex + 1.
	^ hook