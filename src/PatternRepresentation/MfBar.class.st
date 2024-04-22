Class {
	#name : #MfBar,
	#superclass : #BlElement,
	#classVars : [
		'drum'
	],
	#category : #PatternRepresentation
}

{ #category : #action }
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

{ #category : #accessing }
MfBar >> drum [ 

^drum.
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

{ #category : #removing }
MfBar >> removeDrum [

drum := false.
]
