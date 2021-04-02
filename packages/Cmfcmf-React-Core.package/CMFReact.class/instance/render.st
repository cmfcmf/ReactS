rendering
render

	| newRenderResult |
	elementTree prepareForNextRender.
	
	newRenderResult := self renderNode: rootElement.
	renderResult ifNotNil: [self replaceOldMorphsInWorld: renderResult by: newRenderResult].
	newRenderResult asOrderedCollection do: [:each | each cmfSetCorrespondingReactRoot: self].
	renderResult := newRenderResult.
	
	hooks values concatenation do: #onComponentWasRendered.
	self flag: #todo. "Effect hooks also need to be re-run when a single element is re-rendered."

	^ renderResult