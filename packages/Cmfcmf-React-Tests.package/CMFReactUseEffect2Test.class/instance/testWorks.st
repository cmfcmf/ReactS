as yet unclassified
testWorks

	| expectedRuns a b c |
	expectedRuns := Dictionary newFrom: ((#(a b ab emptyArray noDependencies)) collect: [:each | each -> 1]).
	self assertExpectedRuns: expectedRuns.
	
	a := self subject findByName: 'a'.
	b := self subject findByName: 'b'.
	c := self subject findByName: 'c'.
	
	a click.
	expectedRuns at: #a put: 2.
	expectedRuns at: #ab put: 2.
	expectedRuns at: #noDependencies put: 2.
	self assertExpectedRuns: expectedRuns.
	
	b click.
	expectedRuns at: #b put: 2.
	expectedRuns at: #ab put: 3.
	expectedRuns at: #noDependencies put: 3.
	self assertExpectedRuns: expectedRuns.
	
	c click.
	expectedRuns at: #noDependencies put: 4.
	self assertExpectedRuns: expectedRuns.