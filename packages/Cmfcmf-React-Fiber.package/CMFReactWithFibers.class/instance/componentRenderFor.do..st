as yet unclassified
componentRenderFor: aFiber do: aBlock

	^ CMFCurrentReact value: self during: [ | ret |
		currentFiber := aFiber.
		ret := aBlock value.
		currentFiber := nil.
		ret]