Class {
	#name : #MfFractalCircleElement,
	#superclass : #ToElement,
	#instVars : [
		'currentX',
		'currentY',
		'value'
	],
	#category : #MooflodFractalCircleWidget
}

{ #category : #'as yet unclassified' }
MfFractalCircleElement >> circleExtent [
	currentX := 200.
	currentY:= 200.
	^ 200 @ 200
]

{ #category : #'as yet unclassified' }
MfFractalCircleElement >> createCircle: x y: anY [

	| c |
	c := ToElement new.
	c geometry: BlCircleGeometry new.
	c size: x@anY.
	c border: (BlBorder paint: Color black).
	c width: 3.
	c constraintsDo: [ :e |
		e frame vertical alignCenter.
		e frame horizontal alignCenter ].
	self addChild: c
]

{ #category : #accessing }
MfFractalCircleElement >> currentX [

^currentX.
]

{ #category : #accessing }
MfFractalCircleElement >> currentY [ 
^currentY.
]

{ #category : #initialization }
MfFractalCircleElement >> defaultGeometry [

	^ BlCircleGeometry new
		  matchExtent: self extent.
		  
]

{ #category : #initialization }
MfFractalCircleElement >> initialize [

	super initialize.
	self size: self circleExtent.
	self geometry: self defaultGeometry.
	self border: (BlBorder paint: Color black width: 3).
	self layout: BlFrameLayout new.
	value := 0
]

{ #category : #'as yet unclassified' }
MfFractalCircleElement >> openFractalCircle: aCircle [

	| space |
	space := BlSpace new.
	space root layout: BlFlowLayout horizontal.
	aCircle transformDo: [ :c | c translateBy: 250 @ 150 ].
	space toTheme: MfFractalCircleElementTheme new.
	space root addChild: aCircle.
	space show.
	^ aCircle
]

{ #category : #'as yet unclassified' }
MfFractalCircleElement >> setValue: aValue [

	(aValue between: 0 and: 100) ifTrue: [ self value: aValue ].
	self updateCircles.
]

{ #category : #'as yet unclassified' }
MfFractalCircleElement >> updateCircles [

	currentX := currentX - 5.
	currentY := currentY - 5.
	self children isEmpty ifTrue: [ self removeChildren ].
	1 to: value do: [ :i | self createCircle: currentX y: currentY ].
	self createCircle: currentX y: currentY
]

{ #category : #evaluating }
MfFractalCircleElement >> value [

^value.
]

{ #category : #accessing }
MfFractalCircleElement >> value: aValue [	

value:= aValue.
]
