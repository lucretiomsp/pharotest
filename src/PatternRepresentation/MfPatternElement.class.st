Class {
	#name : #MfPatternElement,
	#superclass : #BlElement,
	#classVars : [
		'pattern'
	],
	#category : #PatternRepresentation
}

{ #category : #adding }
MfPatternElement >> addBarsToThePattern: nbBars [
	| bar changingX |
	
	changingX := 2.5.
   nbBars > 0 ifTrue: 
	[ 1 to: nbBars do: [ :i | 	bar:= MfBar new.
			bar transformDo: [  :t | 
			 t translateBy: changingX@0. ]. 
		changingX := changingX + 35.
		self addChild: bar ].].
	self size: (35 * nbBars )@60.
	
	
	
]

{ #category : #adding }
MfPatternElement >> addDrumInBar [
	self childrenDo: [ :child |
		child addEventHandlerOn: BlMouseDownEvent   do: [ :ee | 
			child background paint color == Color white
			ifTrue: [ child background: Color black ]
			ifFalse: [ child background: Color white  ]
			 ].].
]

{ #category : #'visual properties' }
MfPatternElement >> backgroundPaint [ 
	
	^ Color red
]

{ #category : #initialization }
MfPatternElement >> initialize [ 

	super initialize.
	self size: self patternExtent .
	self background: self backgroundPaint .
	self geometry: BlRectangle new.
	self layout: BlFrameLayout new.
	
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
