rendering
render: react renderInfo: renderInfo userCodeResult: anObject

	renderInfo reusingOldNodes ifTrue: [ | oldProps |
		oldProps := renderInfo oldNode properties.
		"prop that was in oldProps but is not in newProps"
		self flag: #todo.
		self properties
			ifNil: [oldProps ifNotNil: [oldProps keysDo: [:key | Transcript showln: {#updateRemove. key}]]]
			ifNotNil: [self properties keysAndValuesDo: [:key :newValue | (oldProps notNil and: [(oldProps at: key ifAbsent: nil) = newValue]) ifFalse: [Transcript showln: {#update. key. newValue}]]]].
	children ifNotNil: [react renderNodes: children]