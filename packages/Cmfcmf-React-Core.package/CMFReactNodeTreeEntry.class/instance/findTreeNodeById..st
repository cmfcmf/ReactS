public
findTreeNodeById: id

	self id = id ifTrue: [^ self].
	childrenTreeNodes do: [:each | (each findTreeNodeById: id) ifNotNil: [:treeNode | ^ treeNode]].
	keyedChildrenTreeNodes valuesDo: [:each | (each findTreeNodeById: id) ifNotNil: [:treeNode | ^ treeNode]].
	^ nil