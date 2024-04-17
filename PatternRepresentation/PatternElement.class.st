Class {
	#name : #PatternElement,
	#superclass : #BlElement,
	#instVars : [
		'pattern'
	],
	#category : #PatternRepresentation
}

{ #category : #adding }
PatternElement >> addBarToThePattern [ 

	
]

{ #category : #adding }
PatternElement >> addBarToThePattern: nbBars [
	| bar changingX |
	
	changingX := 2.5.
   nbBars > 0 ifTrue: 
	[ 1 to: nbBars do: [ :i | 	bar:= Bar new.
			bar transformDo: [  :t | 
			 t translateBy: changingX@0. ]. 
		changingX := changingX + 35.
		self addChild: bar ].].
	
	
	
]

{ #category : #'visual properties' }
PatternElement >> backgroundPaint [ 
	
	^ Color red
]

{ #category : #initialization }
PatternElement >> initialize [ 

	super initialize.
	self size: self patternExtent .
	self background: self backgroundPaint .
	self geometry: BlRectangle new.
	self layout: BlFrameLayout new.
]

{ #category : #'visual properties' }
PatternElement >> patternExtent [

	^ 561@60
]
