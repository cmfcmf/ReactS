as yet unclassified
findNodeAndIndexById: id

	self id = id ifTrue: [^ self].
	childNodes withIndexDo: [:each :i | (each findNodeAndIndexById: id) ifNotNil: [:nodeAndIndex | 
		^ nodeAndIndex isArray ifFalse: [{nodeAndIndex . i}] ifTrue: [nodeAndIndex]]].
	^ nil