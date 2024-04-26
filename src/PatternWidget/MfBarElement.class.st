Class {
	#name : #MfBarElement,
	#superclass : #BlElement,
	#instVars : [
		'drum'
	],
	#category : #PatternWidget
}

{ #category : #action }
MfBarElement >> assignDrum [
	"Sets drum attribute to true"
drum := true.
]

{ #category : #'visual properties' }
MfBarElement >> backgroundPaint [ 
	"Define the background for a bar"
	^ Color white.
]

{ #category : #'visual properties' }
MfBarElement >> barExtent [
	"Size of a bar"
	^30@52.
]

{ #category : #accessing }
MfBarElement >> drum [ 

^drum.
]

{ #category : #initialization }
MfBarElement >> initialize [ 

	super initialize.
	drum := false.
	self size: self barExtent.
	self background: self backgroundPaint .
	self constraintsDo: [ :e |
        e frame vertical alignCenter. ].
]

{ #category : #removing }
MfBarElement >> removeDrum [
	"Sets drum attribute to false"
drum := false.
]
