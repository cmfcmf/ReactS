accessing
doesNotUnderstand: aMessage

	| key |
	key := aMessage selector.
	(key precedence = 3 and: [(key indexOf: $:) = key size]) ifTrue: [ | value prop |
		prop := key allButLast asSymbol.
		value := aMessage arguments first.
		props ifNil: [props := Dictionary new].
		props at: prop put: value.
		^ self].
	^ super doesNotUnderstand: aMessage