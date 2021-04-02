as yet unclassified
testWorks

	| a b |	
	a := self subject findByName: 'a'.
	b := self subject findByName: 'b'.
	
	self assert: 0 equals: (self subject findByName: 'complexValue') contents asNumber.
	self assert: 1 equals: complexValueCalculations.
		
	a click.
	self assert: 1 equals: (self subject findByName: 'complexValue') contents asNumber.
	self assert: 2 equals: complexValueCalculations.
	
	b click.
	self assert: 1 equals: (self subject findByName: 'complexValue') contents asNumber.
	self assert: 2 equals: complexValueCalculations.