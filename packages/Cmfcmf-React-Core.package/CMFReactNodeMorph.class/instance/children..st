as yet unclassified
children: anObject

	self assert: (anObject isNil or: [anObject isSequenceable]).
	children := anObject