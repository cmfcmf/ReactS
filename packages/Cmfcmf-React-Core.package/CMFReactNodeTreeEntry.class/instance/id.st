as yet unclassified
id

	| id |
	id := index asString.
	node key ifNotNil: [id := id, '(', node key, ')'].
	parent ifNotNil: [id := parent id, '/', id].
	^ id