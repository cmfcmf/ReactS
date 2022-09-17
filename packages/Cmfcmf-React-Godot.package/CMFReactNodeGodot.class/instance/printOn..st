printing
printOn: aStream

	aStream nextPut: $<.
	aStream nextPutAll: godotClass.
	aStream nextPut: $ .
	aStream nextPut: $/.
	aStream nextPut: $>