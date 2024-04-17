Class {
	#name : #Bar,
	#superclass : #BlElement,
	#instVars : [
		'bar'
	],
	#category : #PatternRepresentation
}

{ #category : #'visual properties' }
Bar >> backgroundPaint [ 

	^ Color white.
]

{ #category : #'visual properties' }
Bar >> barExtent [

	^30@52.
]

{ #category : #initialization }
Bar >> initialize [ 

	super initialize.
	self size: self barExtent.
	self background: self backgroundPaint .
	self constraintsDo: [ :e |
        e frame vertical alignCenter. ].
]
