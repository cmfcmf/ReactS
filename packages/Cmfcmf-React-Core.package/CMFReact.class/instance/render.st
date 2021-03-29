rendering
render

	| newRootMorph |
	elementTree prepareForNextRender.
	
	newRootMorph := self renderNode: rootElement.
	(rootMorph notNil and: [rootMorph owner notNil]) ifTrue: [
		rootMorph owner replaceSubmorph: rootMorph by: newRootMorph].
	rootMorph := newRootMorph.

	effectHooks values concatenation do: #run