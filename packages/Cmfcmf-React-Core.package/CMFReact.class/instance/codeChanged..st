as yet unclassified
codeChanged: event

	event isDoIt ifTrue: [^ self].
	"Transcript showln: event."
	
	self flag: #todo. "Only re-render updated components"
	
	"Re-render during the next 'tick' so that errors do not break saving a method"
	Project current addDeferredUIMessage: [self render]