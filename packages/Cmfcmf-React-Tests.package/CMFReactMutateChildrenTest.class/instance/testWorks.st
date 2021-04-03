testing
testWorks

	| btn |
	btn := self subject findByName: 'next'.
	
	btn click.
	btn click.
	btn click.