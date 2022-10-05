reconciliation
fullPathFor: aNode

	^ aNode fourth asString
		ifNotEmpty: [aNode second, (aNode third ifTrue: [':'] ifFalse: ['/']), aNode fourth]
		ifEmpty: ['']