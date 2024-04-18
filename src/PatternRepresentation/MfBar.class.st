Class {
	#name : #MfBar,
	#superclass : #BlElement,
	#instVars : [
		'bar'
	],
	#category : #PatternRepresentation
}

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
	self size: self barExtent.
	self background: self backgroundPaint .
	self constraintsDo: [ :e |
        e frame vertical alignCenter. ].
]
