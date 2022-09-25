public
deleteChildrenFrom: aNumber

	| toDelete |
	toDelete := self childrenTreeNodes size - (aNumber - 1).
	toDelete <= 0 ifTrue: [^ self].
	
	self childrenTreeNodes
		from: aNumber
		to: self childrenTreeNodes size
		do: [:entry | entry onComponentWasDestroyed].
	self childrenTreeNodes removeLast: toDelete