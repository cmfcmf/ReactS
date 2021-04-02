rendering
render

	| newRenderResult |
	elementTree prepareForNextRender.
	
	newRenderResult := self renderNode: rootElement.
	renderResult ifNotNil: [self replaceOldMorphsInWorld: renderResult by: newRenderResult].
	newRenderResult asOrderedCollection do: [:each | each cmfSetCorrespondingReactRoot: self].
	renderResult := newRenderResult.

	^ renderResult