private
reducer: reducer_

	self assert: reducer_ isBlock.
	self assert: reducer_ numArgs == 2.
	reducer := reducer_