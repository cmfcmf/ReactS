as yet unclassified
setter

	^ setter ifNil: [setter := [:value | self set: value]]