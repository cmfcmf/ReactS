tests - errors
testErrorWithoutBoundaryAtStart

	| shouldError |
	shouldError := true.
	
	self
		should: [
			self openComponentBlock: [
				{
					self bubble: #Top.
					[shouldError ifTrue: [self error: 'unique error string'] ifFalse: [self bubble: #Nested]] asComponent}]]
		raise: Error.
	
	self should: [root findTag: #Top] raise: Error.
	
	shouldError := false.
	react reRenderAll.
	
	self shouldnt: [root findTag: #Top] raise: Error.
	self shouldnt: [root findTag: #Nested] raise: Error