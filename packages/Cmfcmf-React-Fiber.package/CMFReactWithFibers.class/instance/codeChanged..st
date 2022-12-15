as yet unclassified
codeChanged: event

	| promise |
	event isDoIt ifTrue: [^ self].
	"Re-render during the next 'tick' so that errors do not break saving a method"
	promise := Promise new.
	Project current addDeferredUIMessage: [
		self onCodeChanged.
		promise resolve].
	^ promise