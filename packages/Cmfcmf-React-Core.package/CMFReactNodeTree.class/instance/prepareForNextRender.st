rendering
prepareForNextRender

	self assert: currentParentEntry == rootEntry.
	self flag: #todo. "maybe we do not need #type"
	self flag: #todo. "Instead of using JsonObject, this should use a proper class."
	currentChildPointer := JsonObject newFrom: {#type -> #index. #index -> 1. #key -> nil}