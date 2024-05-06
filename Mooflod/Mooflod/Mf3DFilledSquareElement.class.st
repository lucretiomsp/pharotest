Class {
	#name : #Mf3DFilledSquareElement,
	#superclass : #ToElement,
	#instVars : [
		'currentY',
		'fill',
		'left'
	],
	#classVars : [
		'value'
	],
	#category : #'Mooflod-3DFilledSquareWidget'
}

{ #category : #accessing }
Mf3DFilledSquareElement >> currentY [ 
^currentY
]

{ #category : #initialization }
Mf3DFilledSquareElement >> defaultGeometry [ 

       ^BlSquareGeometry new
        
      
]

{ #category : #accessing }
Mf3DFilledSquareElement >> fill [ 
^fill 
]

{ #category : #'as yet unclassified' }
Mf3DFilledSquareElement >> fillBehind [
]

{ #category : #'as yet unclassified' }
Mf3DFilledSquareElement >> fillLeft [

	"left := MfFillingLineElement new.
	left size: 50 @ 120.
	left background: Color pink.
	left transformDo: [ :d | d rotateBy: 50 ].
	self addChild: left"
]

{ #category : #'as yet unclassified' }
Mf3DFilledSquareElement >> fillRight [

	| fr |
	fr := MfFillingLineElement new.
	fr size: 50 @ 80.
	fr background: Color pink.
	fr transformDo: [ :d | d rotateBy: 50 ].
	self addChild: fr
]

{ #category : #'initialization - private' }
Mf3DFilledSquareElement >> initBottomLeft [
|bll|

	bll := ToElement new.
	bll geometry: (BlLineGeometry new from: 52 @ 195 to: 103 @ 148).
	bll outskirts: BlOutskirts centered.
	bll border: (BlBorder paint: Color darkGray width: 3).
	^ bll
]

{ #category : #'initialization - private' }
Mf3DFilledSquareElement >> initBottomRight [

	| brl |
	brl := ToElement new.
	brl geometry: (BlLineGeometry new from: 349 @ 198 to: 399 @ 148).
	brl outskirts: BlOutskirts centered.
	brl border: (BlBorder paint: Color darkGray width: 3).
	^ brl
]

{ #category : #'as yet unclassified' }
Mf3DFilledSquareElement >> initFill [

	fill := MfFillingLineElement new.
	fill background: Color pink.
	self addChild: fill.
	"self fillLeft.
	self fillRight.
	self fillBehind"
]

{ #category : #'as yet unclassified' }
Mf3DFilledSquareElement >> initLines [

	self initBottomLeft .
	self initBottomLeft .
	self initTopLeft .
	self initTopRight .

]

{ #category : #'initialization - private' }
Mf3DFilledSquareElement >> initTopLeft [

	| tll |
	tll := ToElement new.
	tll geometry: (BlLineGeometry new from: 102 @ 1 to: 151 @ -48).
	tll outskirts: BlOutskirts centered.
	tll border: (BlBorder paint: Color darkGray width: 3).
	^ tll
]

{ #category : #'initialization - private' }
Mf3DFilledSquareElement >> initTopRight [

	| tlr |
	tlr := ToElement new.
	tlr geometry: (BlLineGeometry new from: -1 @ 2 to: 49 @ -48).
	tlr outskirts: BlOutskirts centered.
	tlr border: (BlBorder paint: Color darkGray width: 3).
	^ tlr
]

{ #category : #initialization }
Mf3DFilledSquareElement >> initialize [

	super initialize.
	self geometry: self defaultGeometry.
	self size: self squareExtent.
	self border: (BlBorder paint: Color darkGray width: 3).
	self effect:
		(BlSimpleShadowEffect color: Color darkGray offset: 50 @ -50).
	self layout: BlFrameLayout new.
	self initFill.
	value := 0
]

{ #category : #accessing }
Mf3DFilledSquareElement >> left [ 
^left
]

{ #category : #'as yet unclassified' }
Mf3DFilledSquareElement >> openSquare: aSquare [

	| space |
	space := BlSpace new.
	space root layout: BlFlowLayout horizontal.

	space toTheme: Mf3DSquareTheme new.

	space root addChild: self initBottomRight.
	space root addChild: self initTopLeft.
	space root addChild: self initBottomLeft.
	space root addChild: aSquare.
	space root addChild: self initTopRight.
	space root childrenDo: [ :s |
		s transformDo: [ :c | c translateBy: 200 @ 150 ] ].
	space show.
	^ aSquare
]

{ #category : #initialization }
Mf3DFilledSquareElement >> setValue: aValue [

	(aValue between: 0 and: 100) ifTrue: [ self value: aValue ].
	self updateSquare
]

{ #category : #'as yet unclassified' }
Mf3DFilledSquareElement >> squareExtent [

	^ 200 @ 200
]

{ #category : #'as yet unclassified' }
Mf3DFilledSquareElement >> updateFill: anY [

	fill size: 195 @ anY
]

{ #category : #'as yet unclassified' }
Mf3DFilledSquareElement >> updateSquare [

	currentY := 0.
	1 to: value do: [ :i |
		currentY := currentY + 2.
		self updateFill: currentY ]
]

{ #category : #evaluating }
Mf3DFilledSquareElement >> value [
^value
]

{ #category : #accessing }
Mf3DFilledSquareElement >> value: v [

value:= v
]
