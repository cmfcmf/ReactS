as yet unclassified
shortName

	| name |
	name := self name asString.
	self assert: (name beginsWith: 'CmfReactHook').
	^ (name copyFrom: 'CmfReactHook' size + 1 to: name size) withFirstCharacterDownshifted