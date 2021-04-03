baseline
baseline: spec
	<baseline>

	spec
		for: #common do: [
			spec
				baseline: 'MorphicTestingFramework'
					with: [spec repository: 'github://hpi-swa-teaching/Morphic-Testing-Framework:master/packages'];
				baseline: 'JSON' with: [spec repository: 'http://www.squeaksource.com/JSON'];
				yourself.
			spec
				package: 'Cmfcmf-React-Core'
					with: [spec requires: #('Cmfcmf-React-Components' 'Cmfcmf-React-Hooks' 'Cmfcmf-React-Morphs' 'JSON')];
				package: 'Cmfcmf-React-Components';
				package: 'Cmfcmf-React-Hooks';
				package: 'Cmfcmf-React-Morphs';
				package: 'Cmfcmf-React-Tests'
					with: [spec requires: #('Cmfcmf-React-Core' 'MorphicTestingFramework')];
				yourself.
			spec
				group: 'default' with: #('Cmfcmf-React-Core');
				group: 'tests' with: #('Cmfcmf-React-Tests');
				yourself];
		yourself