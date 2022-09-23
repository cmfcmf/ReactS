as yet unclassified
ConditionalChild: props

	CMFReact useEffect: [
		"tricky stuff here: we want to just set the instVar; however, when using method components, we actually instantiate a copy of the TestCase class that our React system operates on. So, we go all the way up the stack to find the original instance of our TestCase class."
		[(thisContext findContextSuchThat: [:context | context selector = #testWorks]) receiver markCalledCleanup]].
	
	^ nil