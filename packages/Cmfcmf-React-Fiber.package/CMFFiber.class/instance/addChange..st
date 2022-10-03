changes
addChange: aChange

	changes ifNil: [changes := OrderedCollection new].
	changes add: aChange