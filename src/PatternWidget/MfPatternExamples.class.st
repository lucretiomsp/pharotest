Class {
	#name : #MfPatternExamples,
	#superclass : #Object,
	#category : #PatternWidget
}

{ #category : #'as yet unclassified' }
MfPatternExamples class >> exampleSimplePattern [

	<script>
	| patternelem |
	patternelem := MfPatternElement new
		               min: 4;
		               max: 16;
		               nbsteps: 12.
	patternelem openPattern: patternelem
]
