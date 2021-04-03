testing
testWorks

	| a b oldCallback |
	self assert: callback notNil.
	oldCallback := callback.
	
	a := self subject findByName: 'a'.
	b := self subject findByName: 'b'.
	
	a click.
	self assert: oldCallback ~~ callback.
	oldCallback := callback.
	
	b click.
	self assert: oldCallback == callback