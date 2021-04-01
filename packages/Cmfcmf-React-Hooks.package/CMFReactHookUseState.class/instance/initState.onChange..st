as yet unclassified
initState: anObject onChange: aBlock

	state := anObject isBlock ifTrue: [anObject value] ifFalse: [anObject].
	onChange := aBlock