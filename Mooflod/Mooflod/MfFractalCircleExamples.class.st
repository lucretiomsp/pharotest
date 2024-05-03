Class {
	#name : #MfFractalCircleExamples,
	#superclass : #Object,
	#category : #'Mooflod-FractalCircleWidget'
}

{ #category : #'as yet unclassified' }
MfFractalCircleExamples class >> exampleSimpleFractalCircle [

	<script>
	| c |
	c := MfFractalCircleElement new.
	c setValue: 73.
	c openFractalCircle: c
]
