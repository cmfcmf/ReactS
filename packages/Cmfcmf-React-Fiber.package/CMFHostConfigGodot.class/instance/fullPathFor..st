reconciliation
fullPathFor: aNode

	^ aNode fourth
		ifNotEmpty: [aNode second, (aNode third ifTrue: [':'] ifFalse: ['/']), aNode fourth]
		ifEmpty: ['']