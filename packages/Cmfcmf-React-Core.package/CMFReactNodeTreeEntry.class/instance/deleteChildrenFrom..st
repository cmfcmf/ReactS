public
deleteChildrenFrom: aNumber

	| toDelete |
	toDelete := self childrenTreeNodes size - (aNumber - 1).
	toDelete <= 0 ifTrue: [^ self].
	
	self childrenTreeNodes removeLast: toDelete