accessing
onRender: aBlock

	self assert: aBlock numArgs == 1.
	onRenderBlock := aBlock