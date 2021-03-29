baseline
baseline: spec

	<baseline>
	spec 
		for: #'common' 
		do: [
			spec
				package: 'Cmfcmf-React-Core' with: [spec requires: #('Cmfcmf-React-Components' 'Cmfcmf-React-Hooks' 'Cmfcmf-React-Morphs')];
				package: 'Cmfcmf-React-Components';
				package: 'Cmfcmf-React-Hooks';
				package: 'Cmfcmf-React-Morphs';
				package: 'Cmfcmf-React-Tests' with: [spec requires: #('Cmfcmf-React-Core')];
				yourself.
			spec
				group: 'default' with: #('Cmfcmf-React-Core');
				group: 'tests' with: #('Cmfcmf-React-Tests');
				yourself];
		yourself