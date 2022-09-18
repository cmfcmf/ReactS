rendering
render: react renderInfo: renderInfo userCodeResult: anObject

	self render: react properties: self properties.
	renderInfo reusingOldNodes ifTrue: [ | oldProps |
		godotId := renderInfo oldNode godotId.
		oldProps := renderInfo oldNode properties.
		"prop that was in oldProps but is not in newProps"
		self flag: #todo.
		self properties
			ifNil: [oldProps ifNotNil: [oldProps keysDo: [:key | Transcript showln: {#updateRemove. key}]]]
			ifNotNil: [self properties keysAndValuesDo: [:key :newValue | (oldProps notNil and: [(oldProps at: key ifAbsent: nil) = newValue]) ifFalse: [react addUpdate: {#update. renderInfo treeEntry godotPath. key. newValue}]]]].
	children ifNotNil: [react renderNodes: children]