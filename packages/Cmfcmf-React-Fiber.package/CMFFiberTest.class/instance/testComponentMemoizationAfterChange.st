tests - memoization
testComponentMemoizationAfterChange

	| visited block change |
	visited := 0.
	change := 1.
	block := [
		visited := visited + 1.
		self bubble: #A].
	self openComponentBlock: [
		block asComponent
			memoize: true;
			a: change].
	self assert: 1 equals: visited.
	react reRenderAll.
	self assert: 1 equals: visited.
	
	change := 2.
	react reRenderAll.
	self assert: 2 equals: visited.
	
	react reRenderAll.
	self assert: 2 equals: visited