as yet unclassified
render: props
	
	<memoize>
	
	| counter |
	counter := self useState: 0.
	
	self useEffect: [ | process |
		process := [
			[
				(Delay forMilliseconds: 100) wait.
				counter set: [:old | old + 1].
			] repeat
		] forkNamed: 'cmfcmf'.
		[process terminate]
	] dependencies: {}.

	"The container is not necessary, but helpful to see that it is re-rendering"
	^ CMFReactComponentContainer asElementBuilder children: {
		'Time: ', 
			((counter get // 10 // 60) asString padded: #left to: 3 with: $0), ' m ', 
			((counter get // 10 \\ 60) asString padded: #left to: 2 with: $0), ' s ' , 
			((counter get \\ 10 * 100) asString padded: #left to: 3 with: $0), ' ms'
	}; build