accessing
create: aBlock

	self assert: aBlock numArgs == 1.
	createBlock := aBlock