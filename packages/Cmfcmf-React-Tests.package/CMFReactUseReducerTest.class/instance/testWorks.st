testing
testWorks

	| inc dec reset |
	inc := self subject findByName: 'inc'.
	dec := self subject findByName: 'dec'.
	reset := self subject findByName: 'reset'.
	
	self assert: '0' equals: (self subject findByName: 'count') contents.
	
	inc click.
	inc click.
	self assert: '2' equals: (self subject findByName: 'count') contents.
	
	reset click.
	self assert: '0' equals: (self subject findByName: 'count') contents.
	
	dec click.
	self assert: '-1' equals: (self subject findByName: 'count') contents.