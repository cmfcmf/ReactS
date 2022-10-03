accessing
memoize

	^ memoize ifNil: [self method hasPragma: #memoize]