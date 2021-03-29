as yet unclassified
setMyText: aText

	| result |
	result :=super setMyText: aText.
	onChange ifNotNil: [onChange value: self getMyText].
	^ result