Class {
	#name : #MfPatternElement,
	#superclass : #ToElement,
	#instVars : [
		'nbOfBars'
	],
	#classVars : [
		'max',
		'min',
		'nbbars'
	],
	#category : #PatternWidget
}

{ #category : #adding }
MfPatternElement >> addBarsToThePattern: nbBars [
	"Add all bars element in the pattern to display them"
	
	| bar changingX |
	nbOfBars:= 0.
	
	changingX := 2.5.
	(nbBars between: self min and: self max) ifTrue: [
		nbOfBars := nbBars.
		1 to: nbBars do: [ :i |
			bar := MfBarElement new.
			bar transformDo: [ :t | t translateBy: changingX @ 0 ].
			changingX := changingX + 35.
			self addChild: bar ] ].
	self size: 35 * nbBars @ 60
]

{ #category : #adding }
MfPatternElement >> addDrumInBar [
	"Change the value of the drum attribute for the bar clicked, and update his color for visualization undestanding"

	self childrenDo: [ :child |
		child addEventHandlerOn: BlMouseDownEvent do: [ :evt |
			child drum not
				ifTrue: [
					child background: Color black.
					child assignDrum ]
				ifFalse: [
					child background: Color white.
					child removeDrum ] ] ]
]

{ #category : #'visual properties' }
MfPatternElement >> backgroundPaint [ 
	"Define the background for the pattern"
	^ Color red
]

{ #category : #initialization }
MfPatternElement >> initialize [

	super initialize.
	self size: self patternExtent.
	self geometry: BlRectangleGeometry new.
	self layout: BlFrameLayout new.
	self addBarsToThePattern: self nbbars.
	self addDrumInBar.
	self defaultSkin: MfPatternElementSkin new
]

{ #category : #skin }
MfPatternElement >> installRawStyle [

	super installRawStyle.
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
MfPatternElement >> nbOfBars [

^nbOfBars 
]

{ #category : #accessing }
MfPatternElement >> nbbars [		
	^nbbars.
]

{ #category : #accessing }
MfPatternElement >> nbbars: someNbBars [

nbbars:= someNbBars .
]

{ #category : #initialization }
MfPatternElement >> newRawSkin [ 

^ MfPatternElementSkin new.
]

{ #category : #action }
MfPatternElement >> openPattern: aPattern [

	| space |
	space := BlSpace new.
	space root layout: BlFlowLayout horizontal.
	aPattern transformDo: [ :c | c translateBy: 180 @ 200 ].
	space root addChild: aPattern.
	space toTheme: MfPatternElementTheme new.
	space applyAllSkinInstallers.
	space show.
	^ aPattern
]

{ #category : #'visual properties' }
MfPatternElement >> patternExtent [

	^ 36@60
]
