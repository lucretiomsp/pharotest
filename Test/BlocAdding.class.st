Class {
	#name : #BlocAdding,
	#superclass : #BlElement,
	#instVars : [
		'bloc'
	],
	#category : #Test
}

{ #category : #adding }
BlocAdding >> addElements: circles [
	self count: 25.
	self addChildren: circles.
	self.
]

{ #category : #action }
BlocAdding >> generateCircles [
	| circles |
	circles := 25 timesCollect: 
	[ BlElement new 
	background: Color random;
	size: (20 to: 40) atRandom  @ (20 to: 40) atRandom ;
	position: 280 atRandom @ 280 atRandom;
	geometry: {BlRoundedRectangleGeometry cornerRadius: 2. BlCircle new} atRandom ].
	^ circles.
]

{ #category : #initialization }
BlocAdding >> initialize [ 
	super initialize.
	self size: 400@400.
	self background: Color black.
	"self layout: BlFrameLayout new."
]
