Class {
	#name : #SpaceTest,
	#superclass : #BlSpace,
	#instVars : [
		'space'
	],
	#category : #Test
}

{ #category : #adding }
SpaceTest >> addClickEvent [
		self root addEventHandlerOn: BlMouseDownEvent do:
[ :evt |
	self root addChild: 
	(BlElement new
	background: Color random; 
	size: 20@20;
	geometry: BlCircle new;
	position: evt position 
	)].
]

{ #category : #'as yet unclassified' }
SpaceTest >> backgroundPaint [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"

	| |
	^ Color green.
]

{ #category : #initialization }
SpaceTest >> initialize [ 
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"

	super initialize .
	self root background: Color pink.
	self root size: 500@500.
	self root addEventHandlerOn: BlMouseDownEvent do:
[ :evt |
	self root addChild: 
	(BlElement new
	background: Color random; 
	size: 20@20;
	geometry: BlCircle new;
	position: 480 atRandom @ 480 atRandom 
	)].
	
]
