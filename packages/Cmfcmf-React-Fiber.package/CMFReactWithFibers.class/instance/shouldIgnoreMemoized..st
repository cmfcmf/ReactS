as yet unclassified
shouldIgnoreMemoized: aFiber

	^ batchedUpdates anySatisfy: [:update | update fiber = aFiber]