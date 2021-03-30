as yet unclassified
initState: anObject onUpdate: aBlock

	state := anObject isBlock ifTrue: [anObject value] ifFalse: [anObject].
	onUpdate := aBlock