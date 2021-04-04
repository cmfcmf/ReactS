testing
testWorks

	| defaultValue otherValue changingValue |
	defaultValue := self subject findByName: 'defaultValue'.
	otherValue := self subject findByName: 'otherValue'.
	changingValue := self subject findByName: 'changingValue'.
	
	self assertMorphs: defaultValue contain: 'initial'.
	self assertMorphs: otherValue contain: 'otherValue'.
	self assertMorphs: changingValue contain: '0'.
	
	(self subject findByName: 'btn') click.
	defaultValue := self subject findByName: 'defaultValue'.
	otherValue := self subject findByName: 'otherValue'.
	changingValue := self subject findByName: 'changingValue'.
	
	self assertMorphs: defaultValue contain: 'initial'.
	self assertMorphs: otherValue contain: 'otherValue'.
	self assertMorphs: changingValue contain: '1'