Class {
	#name : #MfBar,
	#superclass : #BlElement,
	#instVars : [
		'drum'
	],
	#category : #PatternWidget
}

{ #category : #action }
MfBar >> assignDrum [
	"Sets drum attribute to true"
drum := true.
]

{ #category : #'visual properties' }
MfBar >> backgroundPaint [ 
	"Define the background for a bar"
	^ Color white.
]

{ #category : #'visual properties' }
MfBar >> barExtent [
	"Size of a bar"
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
	"Sets drum attribute to false"
drum := false.
]
