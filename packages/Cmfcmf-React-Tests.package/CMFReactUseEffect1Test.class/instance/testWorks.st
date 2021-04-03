testing
testWorks

	| counter |
	counter := self subject findByName: 'counter'.
	self assert: '0' equals: counter contents.
	
	(Delay forMilliseconds: 150) wait.
	counter := self subject findByName: 'counter'.
	self assert: '1' equals: counter contents.
	
	(Delay forMilliseconds: 100) wait.
	counter := self subject findByName: 'counter'.
	self assert: '2' equals: counter contents.
	
	self subject resizeBy: 100@100.
	
	(Delay forMilliseconds: 100) wait.
	counter := self subject findByName: 'counter'.
	self assert: '3' equals: counter contents.
	