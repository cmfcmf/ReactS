*Cmfcmf-React-Core
cmfWithStartingUppercaseCharactersDownshifted
	"Return a copy with the first letter downShifted"
	
	| answer |
	
	answer := self copy.
	answer withIndexDo: [:c :i | c isUppercase ifTrue: [answer at: i put: c asLowercase] ifFalse: [^ answer]].
	^ answer