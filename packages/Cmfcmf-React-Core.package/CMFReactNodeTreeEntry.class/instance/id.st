accessing
id

	| id |
	id := node hasKey ifFalse: [{{index}}] ifTrue: [{{index. node key}}].
	parent ifNotNil: [id := parent id, id].
	^ id