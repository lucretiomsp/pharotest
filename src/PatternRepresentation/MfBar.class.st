Class {
	#name : #MfBar,
	#superclass : #BlElement,
	#classVars : [
		'drum'
	],
	#category : #PatternRepresentation
}

{ #category : #'as yet unclassified' }
MfBar >> assignDrum [
drum := true.
]

{ #category : #'visual properties' }
MfBar >> backgroundPaint [ 

	^ Color white.
]

{ #category : #'visual properties' }
MfBar >> barExtent [

	^30@52.
]

{ #category : #initialization }
MfBar >> initialize [ 

	super initialize.
	drum := false.
	self size: self barExtent.
	self background: self backgroundPaint .
	self constraintsDo: [ :e |
        e frame vertical alignCenter. ].
]

{ #category : #testing }
MfBar >> isDrumAssigned [

	^drum.
]

{ #category : #removing }
MfBar >> removeDrum [

drum := false.
]