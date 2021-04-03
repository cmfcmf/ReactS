testing
testWorks

	| defaultValue otherValue changingValue |
	defaultValue := self subject findByName: 'defaultValue'.
	otherValue := self subject findByName: 'otherValue'.
	changingValue := self subject findByName: 'changingValue'.
	
	self assert: 'initial' equals: defaultValue contents.
	self assert: 'otherValue' equals: otherValue contents.
	self assert: '0' equals: changingValue contents.
	
	(self subject findByName: 'btn') click.
	defaultValue := self subject findByName: 'defaultValue'.
	otherValue := self subject findByName: 'otherValue'.
	changingValue := self subject findByName: 'changingValue'.
	
	self assert: 'initial' equals: defaultValue contents.
	self assert: 'otherValue' equals: otherValue contents.
	self assert: '1' equals: changingValue contents.