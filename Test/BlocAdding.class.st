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
	self addChildren: circles.
	self.
]

{ #category : #'as yet unclassified' }
BlocAdding >> generateCircles [
	| circles |
	circles := 25 timesCollect: 
	[ BlElement new 
	background: Color random;
	size: 20@20;
	position: 280 atRandom @ 280 atRandom;
	geometry: BlCircle new.].
	^ circles.
]

{ #category : #initialization }
BlocAdding >> initialize [ 
	super initialize.
	self size: 400@400.
	self background: Color black.
]
