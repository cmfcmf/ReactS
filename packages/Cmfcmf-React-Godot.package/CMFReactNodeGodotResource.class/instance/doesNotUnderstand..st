as yet unclassified
doesNotUnderstand: aMessage

	| key precedence |
	key := aMessage selector.
	(precedence := key precedence) = 1 ifTrue: [^ properties at: key ifAbsent: nil].
	(precedence = 3 and: [(key indexOf: $:) = key size]) ifTrue: [
		properties at: key allButLast asSymbol put: aMessage arguments first.
		^ self].
	^ super doesNotUnderstand: aMessage