printing
printOn: aStream

	self flag: #todo.
	"extend to also print children"
	aStream nextPutAll: '<ErrorBoundary />'