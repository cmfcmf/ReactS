accessing
create: aBlock

	self assert: (aBlock isNil or: [aBlock numArgs == 1]).
	createBlock := aBlock