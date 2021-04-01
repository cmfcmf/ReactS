public
findTreeNodeAndIndexById: id

	self id = id ifTrue: [^ {self . index}].
	childrenTreeNodes withIndexDo: [:each :i | (each findTreeNodeAndIndexById: id) ifNotNil: [:nodeAndIndex | ^ nodeAndIndex]].
	^ nil