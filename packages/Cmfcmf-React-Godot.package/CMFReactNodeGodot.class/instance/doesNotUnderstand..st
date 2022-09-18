accessing
doesNotUnderstand: aMessage

	| key precedence |
	key := aMessage selector.
	(precedence := key precedence) = 1 ifTrue: [^ properties at: key ifAbsent: nil].
	(precedence = 3 and: [(key indexOf: $:) = key size]) ifTrue: [ | value prop |
		prop := key allButLast asSymbol.
		value := aMessage arguments first.
		value isGodotNode ifTrue: [
			value isResource: true.
			value godotId: prop].
		properties at: prop put: value.
		^ self].
	^ super doesNotUnderstand: aMessage