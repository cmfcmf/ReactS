baseline
baseline: spec
	<baseline>

	spec
		for: #common do: [
			spec
				baseline: 'MorphicTestingFramework'
					with: [spec repository: 'github://hpi-swa-teaching/Morphic-Testing-Framework:master/packages'];
				baseline: 'Pheno' with: [spec repository: 'github://tom95/Pheno:master/src'];
				package: 'JSON' with: [spec repository: 'http://www.squeaksource.com/JSON'];
				yourself.
			spec
				package: 'Cmfcmf-React-Core'
					with: [spec requires: #('Cmfcmf-React-Components' 'Cmfcmf-React-Hooks' 'Cmfcmf-React-Morphs' 'JSON')];
				package: 'Cmfcmf-React-Components';
				package: 'Cmfcmf-React-Hooks';
				package: 'Cmfcmf-React-Morphs';
				package: 'Cmfcmf-React-Tests'
					with: [spec requires: #('Cmfcmf-React-Core' 'Cmfcmf-React-Examples-Core' 'MorphicTestingFramework')];
				package: 'Cmfcmf-React-Examples-Core';
				package: 'Cmfcmf-React-Examples-Pheno' with: [spec requires: #('Pheno')];
				yourself.
			spec
				group: 'default' with: #('Cmfcmf-React-Core' 'Cmfcmf-React-Fiber' 'Cmfcmf-React-Examples-Core');
				group: 'tests' with: #('Cmfcmf-React-Tests');
				group: 'withPheno' with: #('default' 'Cmfcmf-React-Examples-Pheno') yourself];
		yourself