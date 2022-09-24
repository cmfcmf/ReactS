rendering
render

	^ self updateFrameDo: [ | newRenderResult |
		elementTree prepareForNextRender.
		
		newRenderResult := self renderNode: rootElement forceReRender: false.
		self replaceOldMorphsInWorld: renderResult by: newRenderResult isRoot: true.
		
		renderResult]