initialize-release
initialize

	super initialize.
	
	forceReRender := false.
	"initialize to nil (an invalid boolean) so that we get an error if it is not set explicitly"
	reusingOldNodes := nil.