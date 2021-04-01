as yet unclassified
testWorks

	| a b btn result |
	a := self subject findByName: 'a'.
	b := self subject findByName: 'b'.
	btn := self subject findByName: 'btn'.
	result := self subject findByName: 'result'.
	
	a sendKeys: '1'; sendKey: Character cr.
	b sendKeys: '2'; sendKey: Character cr.
	btn click.
	self assert: 3 asString equals: result contents