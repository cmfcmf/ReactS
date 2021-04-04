testing
assertMorphs: aMTFMorphWrapper contain: aString

	aMTFMorphWrapper morphs do: [:each | self assert: aString equals: each contents]