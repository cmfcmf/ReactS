testing
testWorks

	| label button |
	label := self subject findByName: 'cnt'.
	button := self subject findByName: 'btn'.
	self assert: '0' equals: label contents.
	button click.
	
	label := self subject findByName: 'cnt'.
	button := self subject findByName: 'btn'.
	self assert: '1' equals: label contents.
	button click.
	
	label := self subject findByName: 'cnt'.
	button := self subject findByName: 'btn'.
	self assert: '2' equals: label contents.
	
	self subject resizeBy: 100@100.
	self assert: '2' equals: label contents