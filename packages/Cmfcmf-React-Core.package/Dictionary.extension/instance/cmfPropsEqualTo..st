*Cmfcmf-React-Core
cmfPropsEqualTo: aDictionary
	self assert: self class == aDictionary class.

	self == aDictionary ifTrue: [^ true].
	self size = aDictionary size ifFalse: [^ false].
	self associationsDo: [:association |
		(aDictionary at: association key ifAbsent: [^ false]) == association value
			ifFalse: [^ false]].
	^true