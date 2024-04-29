Class {
	#name : #MfTimerExamples,
	#superclass : #Object,
	#category : #TimerWidget
}

{ #category : #'as yet unclassified' }
MfTimerExamples class >> exampleSimpleTimer [

<script>

| timer |

timer:= MfTimerElement new value: 20.
timer openTimer: timer.
]
