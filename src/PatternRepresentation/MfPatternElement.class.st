Class {
	#name : #MfPatternElement,
	#superclass : #ToElement,
	#classVars : [
		'max',
		'min',
		'nbbars',
		'pattern'
	],
	#category : #PatternRepresentation
}

{ #category : #adding }
MfPatternElement >> addBarsToThePattern: nbBars [
	"Add all bars element in the pattern to display them"
	| bar changingX |
	changingX := 2.5.
	(nbBars between: self min and: self max) ifTrue: [
		1 to: nbBars do: [ :i |
			bar := MfBar new.
			bar transformDo: [ :t | t translateBy: changingX @ 0 ].
			changingX := changingX + 35.
			self addChild: bar ] ].
	self size: 35 * nbBars @ 60
]

{ #category : #adding }
MfPatternElement >> addDrumInBar [
	"Change the value of the drum attribute for the bar clicked, and update his color for visualization undestanding"
	self childrenDo: [ :child |
		child addEventHandlerOn: BlMouseDownEvent   do: [ :evt | 
			child drum == false
			ifTrue: [ child background: Color black. child assignDrum ]
			ifFalse: [ child background: Color white. child removeDrum]
			 ].].
]

{ #category : #'visual properties' }
MfPatternElement >> backgroundPaint [ 
	"Define the background for the pattern"
	^ Color red
]

{ #category : #initialization }
MfPatternElement >> initialize [ 

	super initialize.
	self size: self patternExtent .
	self background: self backgroundPaint .
	self geometry: BlRectangle new.
	self layout: BlFrameLayout new.
	self addBarsToThePattern: self nbbars .
	self addDrumInBar .
]

{ #category : #initialization }
MfPatternElement >> initializePatternSkin [

self newRawSkin .

]

{ #category : #accessing }
MfPatternElement >> max [ 
	
	^max.
]

{ #category : #accessing }
MfPatternElement >> max: aMax [

	max:=aMax.
]

{ #category : #accessing }
MfPatternElement >> min [ 

	^min.
]

{ #category : #accessing }
MfPatternElement >> min: aMin [

	min:=aMin.
]

{ #category : #accessing }
MfPatternElement >> nbbars [		
	^nbbars.
]

{ #category : #accessing }
MfPatternElement >> nbbars: someNbBars [

nbbars:= someNbBars .
]

{ #category : #action }
MfPatternElement >> openPattern: aPattern [

| space |
	space := BlSpace new.
	space root
		background: Color yellow;
		layout: BlFlowLayout horizontal.
	aPattern transformDo: [ :c |
		c translateBy: 120@200
		 ].
	space root addChild: aPattern .
	self withSkin: 
	space show.
	^ space 



]

{ #category : #accessing }
MfPatternElement >> pattern [

^pattern.
]

{ #category : #accessing }
MfPatternElement >> pattern: aPattern [

pattern:= aPattern.
]

{ #category : #'visual properties' }
MfPatternElement >> patternExtent [

	^ 36@60
]
