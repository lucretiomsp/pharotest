Class {
	#name : #Mf3DFilledSquareElement,
	#superclass : #ToElement,
	#category : #'Mooflod-3DFilledSquare'
}

{ #category : #initialization }
Mf3DFilledSquareElement >> defaultGeometry [ 

       ^BlSquareGeometry new
        
      
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

]

{ #category : #'as yet unclassified' }
Mf3DFilledSquareElement >> openSquare: aSquare [

	| space |
	space := BlSpace new.
	space root layout: BlFlowLayout horizontal.

	space toTheme: Mf3DFilledSquareTheme new.

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

{ #category : #'as yet unclassified' }
Mf3DFilledSquareElement >> squareExtent [

	^ 200 @ 200
]
