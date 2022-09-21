rendering
render: react renderInfo: renderInfo userCodeResult: anObject

	renderInfo reusingOldNodes
		ifTrue: [ | oldProps |
			godotId := renderInfo oldNode godotId.
			self render: react properties: self properties.
			
			oldProps := renderInfo oldNode properties.
			"prop that was in oldProps but is not in newProps"
			self flag: #todo.
			self properties
				ifNil: [oldProps ifNotNil: [oldProps keysDo: [:key | Transcript showln: {#updateRemove. key}]]]
				ifNotNil: [
					self properties keysAndValuesDo: [:key :newValue |
						(oldProps notNil and: [(oldProps at: key ifAbsent: nil) = newValue]) ifFalse: [
							self assert: renderInfo treeEntry node hasGodotId.
							react addUpdate: {#update. renderInfo treeEntry godotPath. key. newValue}]]]]
		ifFalse: [self render: react properties: self properties].
	children ifNotNil: [react renderNodes: children].
	ref ifNotNil: [react addRef: ref for: renderInfo treeEntry godotPath]