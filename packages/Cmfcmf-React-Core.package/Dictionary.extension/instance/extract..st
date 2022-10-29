*Cmfcmf-React-Core
extract: aBlock

	| argumentNames |
	argumentNames := aBlock method propertyValueAt: #cmfArgumentNames ifAbsent: [ | node |
		node := Parser new
			parse: aBlock sourceString
			class: UndefinedObject
			noPattern: true
			notifying: nil
			ifFail: nil.
		aBlock method propertyValueAt: #cmfArgumentNames put: (node body statements first expr arguments
			collect: #name
			as: Array)].
	^ aBlock valueWithArguments: (argumentNames collect: [:name |
		name = #rest
			ifTrue: [self copyWithoutKeys: argumentNames]
			ifFalse: [self at: name ifAbsent: nil]])