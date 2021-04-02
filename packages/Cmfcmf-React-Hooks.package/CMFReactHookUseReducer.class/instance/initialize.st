as yet unclassified
initialize

	super initialize.
	"the identity of the dispatcher must remain identical, therefore cache it in an instance variable"
	dispatcher := [:action | self dispatch: action]