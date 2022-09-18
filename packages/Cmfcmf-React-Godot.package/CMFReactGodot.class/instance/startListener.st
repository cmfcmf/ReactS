communication
startListener

	server := WebServer new
		listenOn: 8000;
		errorHandler: [:ex :req |
			req sendResponseCode: 500 content: 'internal error' type: 'text/plain' do: [:res | ].
			self halt.
			ex signal];
		addService: '/update'
			action: [:req | | update currentPending allUpdates |
				currentPending := (pendingUpdates ifNil: [#()]) copy.
				pendingUpdates := OrderedCollection new.
				
				update := Json readFrom: req getContent readStream.
				update do: [:callback | (callbacks at: callback first) valueWithArguments: callback allButFirst].
				
				allUpdates := currentPending, pendingUpdates.
				allUpdates do: [:u | Transcript showln: u].
				req send200Response: allUpdates asJsonString.
				pendingUpdates := nil]
			methods: #('POST')