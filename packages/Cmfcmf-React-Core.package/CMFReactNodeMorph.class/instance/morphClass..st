accessing
morphClass: aClass

	self assert: (aClass isKindOf: Morph class).
	morphClass := aClass