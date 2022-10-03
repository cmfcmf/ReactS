as yet unclassified
nextHostParent

	self node isHostComponent ifTrue: [^ self].
	^ self parent nextHostParent