Class {
	#name : #MfTimerExamples,
	#superclass : #Object,
	#category : #MooflodTimerWidget
}

{ #category : #'as yet unclassified' }
MfTimerExamples class >> exampleSimpleTimer [

	<script>
	| timer |
	timer := MfTimerElement new value: 30.
	timer openTimer: timer
]
