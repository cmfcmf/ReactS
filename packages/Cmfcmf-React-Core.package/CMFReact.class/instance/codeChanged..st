as yet unclassified
codeChanged: event

	event isDoIt ifTrue: [^ self].
	"Transcript showln: event."
	
	self flag: #todo. "Only re-render updated components"
	self render