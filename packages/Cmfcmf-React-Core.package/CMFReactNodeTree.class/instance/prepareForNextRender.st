rendering
prepareForNextRender

	self assert: currentParentEntry == rootEntry.
	self flag: #todo. "maybe we do not need #type"
	currentChildPointer := JsonObject newFrom: {#type -> #index. #index -> 1. #key -> nil}