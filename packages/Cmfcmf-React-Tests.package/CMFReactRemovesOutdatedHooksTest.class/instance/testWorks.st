as yet unclassified
testWorks

	| label button |
	label := self subject findByName: 'cnt'.
	button := self subject findByName: 'btn'.
	self assert: '0' equals: label contents.
	
	didCallCleanup := false.
	button click.
	
	label := self subject findByName: 'cnt'.
	button := self subject findByName: 'btn'.
	self assert: '1' equals: label contents.
	self assert: didCallCleanup