as yet unclassified
shortName

	| name |
	name := self name asString.
	^ (name copyFrom: 'CmfReactHook' size + 1 to: name size) withFirstCharacterDownshifted