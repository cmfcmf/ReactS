as yet unclassified
shortName

	| name |
	name := self name asString.
	self assert: (name beginsWith: 'CMFReactHook').
	^ (name copyFrom: 'CMFReactHook' size + 1 to: name size) withFirstCharacterDownshifted